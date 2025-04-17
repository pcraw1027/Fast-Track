class ProductAttribute < ApplicationRecord
  belongs_to :company
  belongs_to :product
  belongs_to :brick
  belongs_to :attribute_title
  belongs_to :attribute_value
  belongs_to :product_category_source
end
