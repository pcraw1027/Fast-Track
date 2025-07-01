class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!

  def increment_search
     Product.find(params[:id])&.increment!(:searches)
     render json: { message: "increment success!" }, status: :ok
  end
  
  def show
    product = Product.includes(:company, product_variants: [:media]).find(params[:id])
    company = product.company
    company_name = company.name if company
    rating_distribution = Review.rating_distribution_for(product)
    review_stats = Review.stats_for(product)
    scans = Scan.where(product_id: product.id).count
    
    variant_data = product.product_variants&.map do |v|
      {
        "product_variant" => v,
        "media" => v.media
      }
    end

    render json: {
      product: product,
      scans: scans,
      company_name: company_name,
      product_variants: variant_data,
      rating_distribution: rating_distribution,
      review_stats: review_stats
    }, status: :ok
    
  end

  def search
    query = params[:q].to_s.strip
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    per_page = params[:per_page].to_i || 10
    per_page = 10 if per_page > 10

    from = (page - 1) * per_page

    if query.blank?
      render json: { results: [], total_pages: 0 }
      return
    end

     search_results = Elasticsearch::Model.search({
        from: from,
        size: per_page,
        query: {
          multi_match: {
            query: query,
            fields: %w[name description],
            fuzziness: 'AUTO'
          }
        },
        highlight: {
        pre_tags: ['*'],
        post_tags: ['*'],
        fields: {
          name: {},
          description: {}
        }
      }
      }, [Product, Company])

      total_hits = search_results.response['hits']['total']['value']
      total_pages = (total_hits.to_f / per_page).ceil

      records = parse_multimodel_response(search_results)
  
      render json: {
        results: records,
        current_page: page,
        total_pages: total_pages
      }

  end


  private


  def parse_multimodel_response(response)
    product_ids = []
    company_ids = []
    matches = {}
    response.response['hits']['hits'].each do |hit|
      product_ids << hit['_id'] if hit['_source']['type'] == 'Product'
      company_ids << hit['_id'] if hit['_source']['type'] == 'Company'

       if hit['highlight']
       
        m = {}
        hit['highlight'].each do |field, in_matches|
  
          if m[field]
            next #m[field] << [in_matches.join(' ... ')]
          else
            m[field] = [in_matches.join(' ... ')]
          end
        end
        matches["#{hit['_source']['type']}-#{hit['_id']}"] = m
      end
    end
   
    companies = Company.unscoped.where('id IN (?)', company_ids)

    mapped_companies = companies.map{|c| { 
          id: c.id, 
          name: (matches["Company-#{c.id}"]["name"] ? matches["Company-#{c.id}"]["name"][0] : c.name), 
          logo: c.logo&.url,
          searches: c.searches 
      }
      
    }


    product_with_variants = RawQueryModule.unscoped_products_with_assoc("product_id", product_ids)
            
    products = product_with_variants.map do |pv|
      product = pv.product
      {
          id: pv.id,
          name: product.name,
          description: (matches["Product-#{pv.product_id}"]["description"]&.length > 0 ? truncate_highlighted(matches["Product-#{pv.product_id}"]["description"][0]) : truncate_highlighted_snippet(product.description)),
          searches: pv.searches,
          product_company_id: pv.product_company_id,
          company_name: pv.company_name,
          media: pv.media&.map { |m| { file: m.file&.url } }
      
      }
    end


    {companies: mapped_companies, products: products} 
  end


  def truncate_highlighted_snippet(snippet, word_limit = 15)
    return "" if snippet.blank?

    words = snippet.split(/\s+/)
    return snippet if words.size <= word_limit

    match_index = words.find_index { |w| w.include?('*') }

    if match_index
      start = [match_index - word_limit / 2, 0].max
      stop = [start + word_limit - 1, words.length - 1].min
      words[start..stop].join(" ") + "..."
    else
      words.first(word_limit).join(" ") + "..."
    end
  end

  def truncate_highlighted(snippet)
    return "" if snippet.blank?
    snippet.split(' ... ')[0]
  end


  
 
end