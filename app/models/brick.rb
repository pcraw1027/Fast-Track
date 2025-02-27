class Brick < ApplicationRecord
  belongs_to :klass
  belongs_to :product_category_source
  has_many :products

  validates :code, uniqueness: { scope: :klass,
  message: "should be unique to segment" }
end
