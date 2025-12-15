module Domains
  module Products
    class Product < ApplicationRecord
      include Searchable

      self.table_name = "products"
      attr_accessor :media, :barcode, :level, :new_company_name, :asin, :brick_search
      
      belongs_to :company, class_name: "Domains::Companies::Company", optional: true
      belongs_to :segment, class_name: "Domains::Classifications::Segment", optional: true
      belongs_to :family, class_name: "Domains::Classifications::Family", optional: true
      belongs_to :klass, class_name: "Domains::Classifications::Klass", optional: true
      belongs_to :brick, class_name: "Domains::Classifications::Brick", optional: true
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
      
      #false association, media is assiociated with product_variant directly. This is just to allow us to pass 
      #media as part of product attributes on create and update
      has_many :media
      accepts_nested_attributes_for :media

      has_many :reviews, as: :reviewable, class_name: "Domains::Features::Reviewable::Review", dependent: :destroy
      has_many :list_resources, as: :listable, class_name: "Domains::Features::Listable::ListResource", dependent: :destroy
      has_many :product_attributes, class_name: "Domains::Classifications::ProductAttribute", dependent: :destroy
      has_many :product_variants, class_name: "Domains::Products::ProductVariant", dependent: :destroy
      has_many :pit_records, class_name: "Domains::CroupierCore::PitRecord", dependent: :destroy
      

      default_scope -> { order(name: :asc) }

      def self.searchable_fields
        %i[name description]
      end

      define_search_mappings!

      index_name "product_search_index"

      def level_1_flag
        name.present? && description.present? && company_id.present?
      end

      def level_2_flag
        segment_id.present? && family_id.present? && klass_id.present? && brick_id.present?
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
  end
end


