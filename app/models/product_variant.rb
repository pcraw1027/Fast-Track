class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :media, as: :mediaable, dependent: :destroy

  accepts_nested_attributes_for :media, allow_destroy: true
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
end



