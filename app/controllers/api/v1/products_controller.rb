class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!
  
  def show
    product = Product.includes(:product_variants).find(params[:id])
    render json: {
      product: product,
      product_variants: product.product_variants
      }, status: :ok
  end
  
 
end