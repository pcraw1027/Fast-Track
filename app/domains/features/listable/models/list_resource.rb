module Domains
  module Features
    module Listable
      class ListResource < ApplicationRecord
        self.table_name = "list_resources"

        LISTABLE_TYPE_MAP = {
                        "products" => "Domains::Products::Product",
                        "companies" => "Domains::Companies::Company"
                      }.freeze
        
        belongs_to :listable, polymorphic: true, optional: true
        belongs_to :list, class_name: "Domains::Users::List"

        def self.load_data(per_page:, page:, list_id:, listable_type:nil)
          page     = page.to_i.positive? ? page.to_i : 1
          per_page = per_page.to_i.positive? ? per_page.to_i : 10
          offset   = (page - 1) * per_page

          base_query = includes(:listable)
                       .where(list_id: list_id)

          total_count = base_query.count

          product_ids = []

          records = base_query
                    .order(updated_at: :desc)
                    .limit(per_page)
                    .offset(offset)
                    .map do |rs|
                      hash = {
                        resource: rs
                      }
                       
                      if rs.listable_type == "Domains::Products::Product"
                        product_ids.push(rs.listable.id)
                        hash[:product_id] = rs.listable.id
                      else
                        hash[:resource_detail] = rs.listable
                      end
                      hash
                    end
           
          if product_ids.any?
              p_vs = Domains::CroupierCore::RawQueryModule.unscoped_products_with_assoc("product_id", product_ids)
                  
              p_mapped = p_vs.map do |pv|
                  {
                    product_variant: pv,
                    media: pv.media,
                    product_id: pv.product_id
                  }
              end



              products_hash = p_mapped.each_with_object({}) do |item, hash|
                                product_id = item[:product_id]

                                hash[product_id] ||= {
                                  product_variant: nil,
                                  media: nil
                                }

                                hash[product_id][:product_variant] = item[:product_variant]
                                hash[product_id][:media] = item[:media]
                              end


              records = records.map do |rec|
                          res = rec
                          res[:product_details] = products_hash[rec[:product_id]] if rec[:product_id]
                          rec
                        end
              end


          PaginatedResult.new(records, per_page, page, total_count)
        end
      end
    end
  end
end
