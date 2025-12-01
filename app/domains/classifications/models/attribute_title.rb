module Domains
  module Classifications
    class AttributeTitle < ApplicationRecord
      attr_accessor :brick_id
      self.table_name = "attribute_titles"
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
    end
  end
end
