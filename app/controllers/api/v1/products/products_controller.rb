class Api::V1::Products::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!

  def increment_search
     Domains::Products::Product.find(params[:id])&.increment!(:searches)
     render json: { message: "increment success!" }, status: :ok
  end
  
  def show
    product = Domains::Products::Product.includes(:company, product_variants: [:media]).find(params[:id])
    company = product.company
    company_name = company.name if company
    rating_distribution = Domains::Features::Reviewable::Review.rating_distribution_for(product)
    review_stats = Domains::Features::Reviewable::Review.stats_for(product)
    scans = Domains::CroupierCore::Scan.where(product_id: product.id).count
    
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
      company_snapshot: company&.company_snapshot,
      product_variants: variant_data,
      rating_distribution: rating_distribution,
      review_stats: review_stats
    }, status: :ok
    
  end



  def search
    query = params[:q].to_s.strip
    page = (params[:page] && params[:page].to_i > 0) ? params[:page].to_i : 1
    per_page = (params[:per_page] && params[:per_page].to_i > 0 && params[:per_page].to_i <= 10) ? params[:per_page]&.to_i : 50
    from = (page - 1) * per_page

    if query.blank?
      render json: { results: [], total_pages: 0 }
      return
    end

    query_length = query.length

    elastic_query = {
      from: from,
      size: per_page,
      query: { bool: { should: [], minimum_should_match: 1 } },
      highlight: {
        pre_tags: ['*'],
        post_tags: ['*'],
        fields: {
          name: {},
          description: {}
        }
      }
    }

    # Always attempt exact matches first
    elastic_query[:query][:bool][:should] << {
      match_phrase_prefix: { name: { query: query, boost: 5 } }
    }

    # logic based on character count
    if query_length == 1
      elastic_query[:query][:bool][:should] += [
        { match_phrase_prefix: { name: { query: query, boost: 5 } } }
      ]
    elsif query_length == 2
      elastic_query[:query][:bool][:should] += [
        { match_phrase_prefix: { name: { query: query, boost: 5 } } }
      ]
    elsif query_length == 3
      elastic_query[:query][:bool][:should] += [
        { match_phrase_prefix: { name: { query: query, boost: 5 } } },
       { match_phrase_prefix: { description: { query: query, boost: 4 } } },
        { wildcard: { name: "*#{query}*" } }
      ]
    elsif query_length >= 4
      elastic_query[:query][:bool][:should] += [
        { match_phrase_prefix: { name: { query: query, boost: 5 } } },
        { match_phrase_prefix: { description: { query: query, boost: 4 } } },
        { wildcard: { name: "*#{query}*" } }
      ]
    end

    # Exec search
    search_results = Elasticsearch::Model.search(elastic_query, [Domains::Companies::Company, Domains::Products::Product])

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

    companies = Domains::Companies::Company.unscoped.where(id: company_ids)

    mapped_companies = companies.map{|c| { 
          id: c.id, 
          name: (matches["Company-#{c.id}"]["name"] ? matches["Company-#{c.id}"]["name"][0] : c.name), 
          logo: c.logo&.url,
          searches: c.searches 
      }
      
    }


    product_with_variants = Domains::CroupierCore::RawQueryModule.unscoped_products_with_assoc("product_id", product_ids)
            
    products = product_with_variants.map do |pv|
      product = pv.product
      {
          id: pv.id,
          name: product.name,
          description: ((matches["Product-#{pv.product_id}"]["description"] 
                            && matches["Product-#{pv.product_id}"]["description"].length > 0 ) 
                            ? truncate_highlighted(matches["Product-#{pv.product_id}"]["description"][0]) 
                              : truncate_snippet(product.description)),
          searches: pv.searches,
          product_company_id: pv.product_company_id,
          company_name: pv.company_name,
          media: pv.media&.map { |m| { file: m.file&.url } }
      
      }
    end
    {companies: mapped_companies, products: products} 
  end


  def truncate_snippet(snippet, word_limit = 15)
    return "" if snippet.blank?
    words = snippet.split(/\s+/)
    return snippet if words.size <= word_limit
    words.first(word_limit).join(" ") + "..."
  end

  def truncate_highlighted(snippet)
    return "" if snippet.blank?
    snippet.split(' ... ')[0]
  end
 
end