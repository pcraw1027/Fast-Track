class Segment < ApplicationRecord
  belongs_to :product_category_source
  has_many :products 
  has_many :families, dependent: :destroy
  has_many :klasses, :through => :families
  has_many :bricks, :through => :klasses


  validates :code, uniqueness: true

end
