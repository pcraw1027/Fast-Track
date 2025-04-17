class Family < ApplicationRecord
  belongs_to :segment
  belongs_to :product_category_source
  has_many :products
  has_many :klasses, dependent: :destroy
  has_many :bricks, :through => :klasses

  validates :code, uniqueness: { scope: :segment, message: "should be unique to class" }
end
