

module Domains
  module Classifications
    class Segment < ApplicationRecord
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
      has_many :products, class_name: "Domains::Products::Product"
      has_many :families, dependent: :destroy, class_name: "Domains::Classifications::Family"
      has_many :klasses, :through => :families, class_name: "Domains::Classifications::Klass"
      has_many :bricks, :through => :klasses, class_name: "Domains::Classifications::Brick"


      validates :code, uniqueness: true
      self.table_name = "segments"

    end

    end
end