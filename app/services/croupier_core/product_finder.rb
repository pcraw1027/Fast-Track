class CroupierCore::ProductFinder < ApplicationService
  def call(barcode:)
    product_variant = ProductVariant.find_by(barcode: barcode)
    if product_variant
      success product_variant.product
    else 
      success nil
    end
  end
end
