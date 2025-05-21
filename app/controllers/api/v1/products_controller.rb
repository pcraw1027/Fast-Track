class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!
  
  def show
    product = Product.includes(:company, product_variants: [:media]).find(params[:id])
    company = product.company
    company_name = company.name if company
    rating_distribution = Review.rating_distribution_for(product)
    review_stats = Review.stats_for(product)
    
    variant_data = product.product_variants&.map do |v|
      {
        "product_variant" => v,
        "media" => v.media
      }
    end

    render json: {
      product: product,
      company_name: company_name,
      product_variants: variant_data,
      rating_distribution: rating_distribution,
      review_stats: review_stats
    }, status: :ok
  end

  
 
end