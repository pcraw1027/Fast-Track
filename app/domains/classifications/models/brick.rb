module Domains
  module Classifications
      class Brick < ApplicationRecord
        attr_accessor :search_query
        belongs_to :klass, class_name: "Domains::Classifications::Klass"
        belongs_to :product_category_source, class_name: "Domains::Classifications::ProductCategorySource"
        has_many :products, class_name: "Domains::Products::Product"
        
        #this helps in bulk creation for bricks. Not a reall association as it's not being used
        has_many :attribute_titles, class_name: "Domains::Classifications::AttributeTitle"

        accepts_nested_attributes_for :attribute_titles, reject_if: :all_blank

        validates :code, uniqueness: { scope: :klass,
        message: "should be unique to segment" }

        self.table_name = "bricks"

        def self.index_data(product_category_source_id, klass_id, search_query, page)
          klass = nil
          bricks = Domains::Classifications::Brick.where(nil)
          if product_category_source_id.present?
            bricks = bricks.where(product_category_source_id: product_category_source_id)                                  
          end 
          if klass_id.present?
            klass = Domains::Classifications::Klass.find(klass_id)
            bricks = bricks.where(klass_id: klass_id) 
          end
          if search_query.present?
            search_query = "%#{search_query}%"
            query = "code ILIKE :query OR " \
                    "title ILIKE :query"
            bricks = bricks.where(query, query: search_query)
          end
          bricks = bricks.includes(:klass)
                            .references(:klass)                                         
                            .paginate(page: page, per_page: 15)
                            .order("klasses.title ASC, bricks.title ASC")
          [klass, bricks]
        end

        def self.search_by_title(query)
          search_result = if query.present?
              Domains::Classifications::Brick.where("title ILIKE ?", "%#{query}%")
                      else
              Domains::Classifications::Brick.none
                      end

          klasses = Domains::Classifications::Klass.includes(family: [:segment]).where(id: search_result&.map(&:klass_id))
          klasses_h = klasses&.group_by(&:id)
          result = []

          search_result.each do |brick|
            klass = klasses_h[brick.klass_id]
            family = klass.family
            segment = family.segment

            result << {
                id: brick.id,
                code: brick.code,
                title: brick.title,
                klass: { id: klass.id, code: klass.code, title: klass.title },              
                family: { id: family.id, code: family.code, title: family.title },
                segment: { id: segment.id, code: segment.code, title: segment.title }
              } 
          end
          result

        end

      end
  end
end

