module Domains
  module Products
    class Product < ApplicationRecord
      include Searchable

      self.table_name = "products"
      attr_accessor :media, :barcode, :level, :new_company_name, :asin, :brick_search, :capture_status

      ORDER_BY = {
      "" => "products.updated_at DESC, products.id DESC",
      nil => "products.updated_at DESC, products.id DESC",
      "product_name" => "products.name ASC, segments.title ASC, families.title ASC, klasses.title ASC, bricks.title ASC",
      "company_name" => "companies.name ASC, products.name ASC, segments.title ASC, families.title ASC, klasses.title ASC, bricks.title ASC",
      "product_category" => "segments.title ASC, families.title ASC, klasses.title ASC, bricks.title ASC, products.name ASC"
      }
      
      belongs_to :company, class_name: "Domains::Companies::Company", optional: true
      belongs_to :segment, class_name: "Domains::Classifications::Segment", optional: true
      belongs_to :family, class_name: "Domains::Classifications::Family", optional: true
      belongs_to :klass, class_name: "Domains::Classifications::Klass", optional: true
      belongs_to :brick, class_name: "Domains::Classifications::Brick", optional: true
      belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource", optional: true
      
      #false association, media is assiociated with product_variant directly. This is just to allow us to pass 
      #media as part of product attributes on create and update
      has_many :media
      accepts_nested_attributes_for :media

      has_many :reviews, as: :reviewable, class_name: "Domains::Features::Reviewable::Review", dependent: :destroy
      has_many :list_resources, as: :listable, class_name: "Domains::Features::Listable::ListResource", dependent: :destroy
      has_many :product_attributes, class_name: "Domains::Classifications::ProductAttribute", dependent: :destroy
      has_many :product_variants, class_name: "Domains::Products::ProductVariant", dependent: :destroy
      has_many :pit_records, class_name: "Domains::CroupierCore::PitRecord", dependent: :destroy
      

      #default_scope -> { order(name: :asc) }

      def self.searchable_fields
        %i[name description]
      end 

      define_search_mappings!

      index_name "product_search_index"

      def has_image?
        product_variants.joins(:media).exists?
      end


      def level_1_flag
        name.present? && description.present? && company_id.present? && has_image?
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

      def self.similar_products(id:, page:, per_page:)
        page     = page.to_i.positive? ? page.to_i : 1
        per_page = per_page.to_i.positive? ? per_page.to_i : 10
        offset   = (page - 1) * per_page
        product = find(id)

        if product.brick_id.blank?
          return PaginatedResult.new([], per_page, page, 0)
        else

          base_query = Domains::Products::Product
                      .where.not(id: id)
                      .where(brick_id: product.brick_id)

          total_count = base_query.count
    
          name = ActiveRecord::Base.sanitize_sql_like(product.name)
          quoted_name = ActiveRecord::Base.connection.quote(name)

          products = base_query
                    .order(
                      Arel.sql(
                        <<~SQL
                          (
                            CASE
                              WHEN name ILIKE #{quoted_name} THEN 3
                              WHEN name ILIKE #{quoted_name} || '%' THEN 2
                              WHEN name ILIKE '%' || #{quoted_name} || '%' THEN 1
                              ELSE 0
                            END
                          ) DESC
                        SQL
                      )
                    )
                    .limit(per_page)
                    .offset(offset)

            product_ids = products.map(&:id)
            product_scan_counts = Domains::CroupierCore::RawQueryModule.get_scan_count(product_ids)

            #load product_variants data
            product_variants = Domains::CroupierCore::RawQueryModule.unscoped_products_with_assoc("product_id", product_ids)

              
          records = product_variants.map do |pv|
              {
                scan_count: product_scan_counts[pv.product_id] || 0,
                product_variant: pv,
                media: pv.media
              }
          end      

            return PaginatedResult.new(records, per_page, page, total_count)
          end
      end

      def self.with_display_data(id)
        product = includes(:company, product_variants: [:media]).find(id)
        company = product.company
        company_name = company.name if company
        rating_distribution = Domains::Features::Reviewable::Review.rating_distribution_for(product)
        review_stats = Domains::Features::Reviewable::Review.stats_for(product)
        scans = Domains::CroupierCore::Scan.where(product_id: product.id).count
        
        variant_data = product.product_variants&.map do |v|
          {
            "product_variant" => v,
            "media" => v.media
          }
        end

        {
            product: product,
            scans: scans,
            company_name: company_name,
            company_snapshot: company&.company_snapshot,
            product_variants: variant_data,
            rating_distribution: rating_distribution,
            review_stats: review_stats
        }
      end

    end
  end
end




