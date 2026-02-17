module Domains
  module CroupierCore
    module Operations
      class ProductFinder < ApplicationService
        def call(barcode:)
          product_variant = Domains::Products::ProductVariant.find_by(barcode: barcode)
          if product_variant
            product = Domains::Products::Product.find(product_variant.product_id)
            success (product.level_1_flag ? product : nil)
          else 
            success nil
          end
        end
      end
     
    end
  end
end