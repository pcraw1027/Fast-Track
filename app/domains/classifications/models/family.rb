module Domains
  module Classifications
      class Family < ApplicationRecord
        belongs_to :segment, class_name: "Domains::Classifications::Segment"
        belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
        has_many :products, class_name: "Domains::Products::Product"
        has_many :klasses, dependent: :destroy, class_name: "Domains::Classifications::Klass"
        has_many :bricks, through: :klasses, class_name: "Domains::Classifications::Brick"
      
        validates :code, uniqueness: { scope: :segment, message: "should be unique to class" }
        self.table_name = "families"
      end
  end
end

