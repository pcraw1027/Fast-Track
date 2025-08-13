class ProductVariant < ApplicationRecord
  include BarcodeValidations
  belongs_to :product
  has_many :media, as: :mediaable, dependent: :destroy

  accepts_nested_attributes_for :media, allow_destroy: true
  validates :barcode, uniqueness: true
  

end



