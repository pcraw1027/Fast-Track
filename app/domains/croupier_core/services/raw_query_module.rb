module Domains
  module CroupierCore
    module RawQueryModule

        def self.my_scan_products(per_page, page, current_user_id)
            per_page = per_page.to_i
            page = page.to_i
            offset = (page - 1) * per_page

            recent_scan_data = Domains::CroupierCore::Scan
                              .joins(product: { product_variants: :media }) 
                              .where(product_exists: true, user_id: current_user)
                              .where.not(scans: { product_id: nil })
                              .where(
                                "products.name IS NOT NULL AND products.name != '' AND
                                products.description IS NOT NULL AND products.description != '' AND
                                products.company_id IS NOT NULL"
                              )
                              .distinct
                              .order(scans: { created_at: :desc })
                              .limit(per_page)
                              .offset(offset)

            #count product scans on matched products
            product_ids = recent_scan_data.map(&:product_id)
            product_scan_counts = {}

            product_scan_counts = get_scan_count(product_ids)

            #load product_variants data
            product_variants = unscoped_products_with_assoc("barcode", recent_scan_data.map(&:barcode))
            
            total_count = Domains::CroupierCore::Scan
                              .joins(product: { product_variants: :media }) 
                              .where(product_exists: true, user_id: current_user)
                              .where.not(scans: { product_id: nil })
                              .where(
                                "products.name IS NOT NULL AND products.name != '' AND
                                products.description IS NOT NULL AND products.description != '' AND
                                products.company_id IS NOT NULL"
                              )
                              .count("DISTINCT scans.product_id")

            #scan_map = recent_scans.index_by(&:barcode)
            barcode_hash = {} 


            product_variants.each do |pv|
                barcode_hash[pv.barcode] = {
                  scan_count: product_scan_counts[pv.product_id] || 0,
                  product_variant: pv,
                  media: pv.media
                }
            end

            records = recent_scan_data.map do |scn|
              #next if barcode_hash[scn.barcode].blank?
              {
                scan: scn,
                product_data: barcode_hash[scn.barcode]
              }
            end

            PaginatedResult.new(records, per_page, page, total_count)
        end


         def self.recent_scan_products(per_page, page)
          per_page = per_page.to_i
          page = page.to_i
          offset = (page - 1) * per_page

          product_ids_query = Domains::CroupierCore::Scan
                              .joins(product: { product_variants: :media }) 
                              .select("scans.product_id as product_id")
                              .where(product_exists: true)
                              .where.not(scans: { product_id: nil })
                              .where(
                                "products.name IS NOT NULL AND products.name != '' AND
                                products.description IS NOT NULL AND products.description != '' AND
                                products.company_id IS NOT NULL"
                              )
                              .distinct
                              .order(scans: { created_at: :desc })
                              .limit(per_page)
                              .offset(offset)

          product_ids = product_ids_query.map(&:product_id)

          total_count = Domains::CroupierCore::Scan
                        .joins(product: { product_variants: :media })
                        .where(product_exists: true)
                        .where.not(scans: { product_id: nil })
                        .where(
                          "products.name IS NOT NULL AND products.name != '' AND
                          products.description IS NOT NULL AND products.description != '' AND
                          products.company_id IS NOT NULL"
                        )
                        .count("DISTINCT scans.product_id")
        
          product_scan_counts = get_scan_count(product_ids)

          #load product_variants data
          product_variants = unscoped_products_with_assoc("product_id", product_ids)
              
          records = product_variants.map do |pv|
              {
                scan_count: product_scan_counts[pv.product_id] || 0,
                product_variant: pv,
                media: pv.media
              }
          end

          PaginatedResult.new(records, per_page, page, total_count)
        end


        def self.top_scan_products(per_page, page)
          per_page = per_page.to_i
          page = page.to_i
          offset = (page - 1) * per_page


          product_ids_query = Domains::CroupierCore::Scan
                              .joins(product: { product_variants: :media })
                              .where(product_exists: true)
                              .where.not(scans: { product_id: nil })
                              .where(
                                "products.name IS NOT NULL AND products.name != '' AND
                                products.description IS NOT NULL AND products.description != '' AND
                                products.company_id IS NOT NULL"
                              )
                              .select("scans.product_id AS product_id, COUNT(scans.id) AS scans_count")
                              .group("scans.product_id")
                              .order("scans_count DESC")
                             


          product_ids = product_ids_query.map(&:product_id)

          total_count = Domains::CroupierCore::Scan
                              .joins(product: { product_variants: :media })
                              .where(product_exists: true)
                              .where.not(scans: { product_id: nil })
                              .where(
                                "products.name IS NOT NULL AND products.name != '' AND
                                products.description IS NOT NULL AND products.description != '' AND
                                products.company_id IS NOT NULL"
                              )
                              .count("DISTINCT scans.product_id")

          product_scan_counts = get_scan_count(product_ids)

          product_variants = unscoped_products_with_assoc("product_id", product_ids)

              
          records = product_variants.map do |pv|
              {
                scan_count: product_scan_counts[pv.product_id] || 0,
                product_variant: pv,
                media: pv.media
              }
          end

          PaginatedResult.new(records, per_page, page, total_count)
        end


        def self.get_scan_count(product_ids)
            return {} if product_ids.blank?
            scan_counts_query = <<-SQL.squish
              SELECT product_id, COUNT(*) AS scan_count
              FROM scans
              WHERE product_id IN (#{product_ids.join(',')})
              GROUP BY product_id
            SQL

              scan_counts = ActiveRecord::Base.connection.exec_query(scan_counts_query)
              scan_counts.rows.to_h
        end

      
        def self.unscoped_products_with_assoc(attribute_key, values)
            qualified_attr =
              case attribute_key.to_s
              when "product_id" then "pit_records.product_id"
              when "barcode"    then "pit_records.barcode"
              else
                raise ArgumentError, "Unsupported attribute_key: #{attribute_key}"
              end

            Domains::Products::ProductVariant.unscoped
              .joins(:media) 
              .left_joins(product: [:company, :reviews, :pit_records])
              .where("#{qualified_attr} IN (?)", values)
              .where(pit_records: { capture_status: 0 })
              .where.not(products: { company_id: nil, name: nil, description: nil }) 
              .select(
                "product_variants.*",
                "products.id AS product_id",
                "products.name AS product_name",
                "products.description AS product_description",
                "products.searches AS searches",
                "products.company_id AS product_company_id",
                "companies.name AS company_name",
                "AVG(reviews.rating) AS avg_rating"
              )
              .group(
                "product_variants.id",
                "products.id",
                "companies.id"
              )
              .order(
                Arel.sql("array_position(ARRAY[?], #{qualified_attr})"),
                values
              )
          end

      
    end
  end
end


