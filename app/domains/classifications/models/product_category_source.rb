module Domains
  module Classifications
    class ProductCategorySource < ApplicationRecord
      has_many :segments, class_name: "Domains::Classifications::Segment"
      has_many :attribute_titles, class_name: "Domains::Classifications::AttributeTitle"
      has_many :attribute_values, class_name: "Domains::Classifications::AttributeValue"
      has_many :product_attributes, class_name: "Domains::Classifications::ProductAttribute"
      has_many :families, class_name: "Domains::Classifications::Family"
      has_many :klasses, class_name: "Domains::Classifications::Klass"
      has_many :bricks, class_name: "Domains::Classifications::Brick"
      has_many :products, class_name: "Domains::Products::Product"
      self.table_name = "product_category_sources"
    end
  end
end
