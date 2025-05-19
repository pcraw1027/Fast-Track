class Product < ApplicationRecord

  attr_accessor :media
  attr_accessor :barcode
  attr_accessor :new_company_name
  attr_accessor :asin
  belongs_to :company, optional: true
  belongs_to :segment, optional: true
  belongs_to :family, optional: true
  belongs_to :klass, optional: true
  belongs_to :brick, optional: true
  belongs_to :product_category_source

  #false association, media is assiociated with product_variant directly. This is just to allow us to pass media as a paramter
  has_many :media
  accepts_nested_attributes_for :media

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :pit_records, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }

end


