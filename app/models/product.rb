class Product < ApplicationRecord
  belongs_to :company
  belongs_to :segment
  belongs_to :family
  belongs_to :klass
  belongs_to :brick

  mount_uploader :image, ImageUploader

  has_many :product_attributes
end
