module Domains
  module Classifications
      class Brick < ApplicationRecord
        attr_accessor :search_query
        belongs_to :klass, class_name: "Domains::Classifications::Klass"
        belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
        has_many :products, class_name: "Domains::Products::Product"

        validates :code, uniqueness: { scope: :klass,
        message: "should be unique to segment" }

        self.table_name = "bricks"
      end
  end
end

