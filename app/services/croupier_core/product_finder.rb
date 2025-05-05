class CroupierCore::ProductFinder < ApplicationService
  def call(barcode:)
    product_variant = ProductVariant.find_by(barcode: barcode)
    if product_variant
      product = Product.includes(:product_variants).find(product_variant.product_id)
      success product
    else 
      success nil
    end
  end
end