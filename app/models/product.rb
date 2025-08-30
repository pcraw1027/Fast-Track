class Product < ApplicationRecord
  include Searchable

  attr_accessor :media, :barcode, :level, :new_company_name, :asin, :brick_search
  
  belongs_to :company, optional: true
  belongs_to :segment, optional: true
  belongs_to :family, optional: true
  belongs_to :klass, optional: true
  belongs_to :brick, optional: true
  belongs_to :product_category_source

  #false association, media is assiociated with product_variant directly. This is just to allow us to pass 
  #media as part of product attributes on create and update
  has_many :media
  accepts_nested_attributes_for :media

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :pit_records, dependent: :destroy
  
  default_scope -> { order(name: :asc) }

  def self.searchable_fields
    %i[name description]
  end

  define_search_mappings!

  index_name "product_search_index"

  def level_1_flag
    self.name.present? && self.description.present? && self.company_id.present?
  end

  def level_2_flag
    self.segment_id.present? && self.family_id.present? && self.klass_id.present? && self.brick_id.present?
  end

  def level_3_flag
    false
  end

  def level_4_flag
    false
  end

  def level_5_flag
    false
  end

end


