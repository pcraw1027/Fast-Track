class Klass < ApplicationRecord
  belongs_to :family
  belongs_to :product_category_source
  has_many :products
  has_many :bricks, dependent: :destroy

  validates :code, uniqueness: { scope: :family,
  message: "should be unique to segment" }

end
