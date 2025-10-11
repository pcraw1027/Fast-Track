module Domains
  module Classifications
    class AttributeTitle < ApplicationRecord
      self.table_name = "attribute_titles"
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
    end
  end
end
