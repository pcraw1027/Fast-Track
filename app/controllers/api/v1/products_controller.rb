class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user!
  
  def show
    product = Product.includes(:product_variants, :company).find(params[:id])
    company = product.company
    company_name = company.name if company
    render json: {
      product: product,
      company_name: company_name,
      product_variants: product.product_variants
      }, status: :ok
  end
  
 
end