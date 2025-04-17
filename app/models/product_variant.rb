class ProductVariant < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
end
