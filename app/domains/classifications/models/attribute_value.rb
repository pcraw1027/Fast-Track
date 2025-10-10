module Domains
  module Classifications
      class AttributeValue < ApplicationRecord
        belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
        self.table_name = "attribute_values"
        has_many :product_attributes, class_name: "Domains::Classifications::ProductAttribute"
      end
    end
end