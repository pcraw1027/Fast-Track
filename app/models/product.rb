class Product < ApplicationRecord
  attr_accessor :image
  attr_accessor :barcode
  mount_uploader :image, ImageUploader
  belongs_to :company
  belongs_to :segment
  belongs_to :family
  belongs_to :klass
  belongs_to :brick

  has_many :product_attributes
  has_many :product_variants
  default_scope -> { order(created_at: :desc) }
end
