module Domains
  module Classifications
      class Klass < ApplicationRecord
        belongs_to :family, class_name: "Domains::Classifications::Family"
        belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
        has_many :products, class_name: "Domains::Products::Product"
        has_many :bricks, dependent: :destroy, class_name: "Domains::Classifications::Brick"
      
        validates :code, uniqueness: { scope: :family,
        message: "should be unique to segment" }
        self.table_name = "klasses"
      
      end
  end
end