class Product < ApplicationRecord
  attr_accessor :image
  attr_accessor :barcode
  mount_uploader :image, ImageUploader
  belongs_to :company, optional: true
  belongs_to :segment, optional: true
  belongs_to :family, optional: true
  belongs_to :klass, optional: true
  belongs_to :brick, optional: true
  belongs_to :product_category_source

  has_many :product_attributes, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end


