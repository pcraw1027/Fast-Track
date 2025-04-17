class AttributeValue < ApplicationRecord
  belongs_to :product_category_source

  has_many :product_attributes
end
