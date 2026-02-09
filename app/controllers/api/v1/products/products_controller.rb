class Api::V1::Products::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!

  def increment_search
     Domains::Products::Product.find(params[:id])&.increment!(:searches)
     render json: { message: "increment success!" }, status: :ok
  end

  def show
    product_data = Domains::Products::Product.with_display_data(params[:id])
    render json: product_data, status: :ok
  end

  def similar_products
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    per_page = 20 if per_page.to_i > 20
    results = Domains::Products::Product.similar_products(id: params[:id], page: page, per_page: per_page)
    render json: results, status: :ok
  end

  def search
    query = params[:q].to_s.strip
    page = params[:page]&.to_i&.positive? ? params[:page].to_i : 1
    per_page = params[:per_page]&.to_i&.positive? && params[:per_page].to_i <= 10 ? params[:per_page]&.to_i : 50
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
    product_type = 'Domains::Products::Product'
    company_type = 'Domains::Companies::Company'
    response.response['hits']['hits'].each do |hit|
      product_ids << hit['_id'] if hit['_source']['type'] == product_type
      company_ids << hit['_id'] if hit['_source']['type'] == company_type

       next unless hit['highlight']
       
       m = {}
       hit['highlight'].each do |field, in_matches|
  
         next if m[field]

           #m[field] << [in_matches.join(' ... ')]
          
           m[field] = [in_matches.join(' ... ')]
          
       end
       matches["#{hit['_source']['type']}-#{hit['_id']}"] = m
    end

    companies = Domains::Companies::Company.unscoped.where(id: company_ids)
    
    mapped_companies = companies.map do |c| 
      { 
        id: c.id, 
        name: (matches["#{company_type}-#{c.id}"]["name"] ? matches["#{company_type}-#{c.id}"]["name"][0] : c.name), 
        logo: c.logo&.url,
        searches: c.searches 
      }
      
    end

    product_with_variants = Domains::CroupierCore::RawQueryModule.unscoped_products_with_assoc("product_id", product_ids)

    products = product_with_variants.map do |pv|

      descr = if matches["#{product_type}-#{pv.product_id}"]["description"]&.length&.positive?
                  truncate_highlighted(matches["#{product_type}-#{pv.product_id}"]["description"][0])
              else
                  truncate_snippet(pv.product_description)
              end
      

      {
        id: pv.product_id,
          name: pv.product_name,
          description: descr,
          searches: pv.searches,
          product_company_id: pv.product_company_id,
          company_name: pv.company_name,
          media: pv.media&.map { |m| { file: m.file&.url } }
      
      }
    end
    { companies: mapped_companies, products: products.compact! } 
  end


  def truncate_snippet(snippet, word_limit = 15)
    return "" if snippet.blank?

    words = snippet.split(/\s+/)
    return snippet if words.size <= word_limit

    "#{words.first(word_limit).join(' ')}..."
  end

  def truncate_highlighted(snippet)
    return "" if snippet.blank?

    snippet.split(' ... ')[0]
  end
 
end