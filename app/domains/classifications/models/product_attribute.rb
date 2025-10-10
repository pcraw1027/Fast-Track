module Domains
  module Classifications
    class ProductAttribute < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company"
      belongs_to :product, class_name: "Domains::Products::Product"
      belongs_to :brick, class_name: "Domains::Classifications::Brick"
      belongs_to :attribute_title, class_name: "Domains::Classifications::AttributeTitle"
      belongs_to :attribute_value, class_name: "Domains::Classifications::AttributeValue"
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
      self.table_name = "product_attributes"
    end

    end
end