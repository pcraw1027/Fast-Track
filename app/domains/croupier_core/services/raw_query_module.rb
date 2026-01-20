module Domains
  module CroupierCore
    module RawQueryModule
        def self.my_scan_products(per_page, page, current_user_id)
            per_page = per_page.to_i
            page = page.to_i
            offset = (page - 1) * per_page

            #select and paginate scans
            recent_scans_sql = <<-SQL.squish
                                  SELECT *
                                  FROM (
                                    SELECT DISTINCT ON (barcode) *
                                    FROM scans
                                    WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)}
                                      AND product_exists = true
                                  ) AS deduped
                                  ORDER BY created_at DESC
                                  LIMIT #{per_page} OFFSET #{offset}
                                SQL

            recent_scan_data = Domains::CroupierCore::Scan.find_by_sql(recent_scans_sql)

            #count product scans on matched products
            product_ids = recent_scan_data.map(&:product_id).compact
            product_scan_counts = {}

            if product_ids.any?
              scan_counts_query = <<-SQL.squish
                SELECT product_id, COUNT(*) AS scan_count
                FROM scans
                WHERE product_id IN (#{product_ids.join(',')})
                GROUP BY product_id
              SQL

              scan_counts = ActiveRecord::Base.connection.exec_query(scan_counts_query)
              product_scan_counts = scan_counts.rows.to_h
            end

            #load product_variants data
            product_variants = unscoped_products_with_assoc("barcode", recent_scan_data.map(&:barcode))
            
            count_query = <<-SQL.squish
              SELECT COUNT(*) AS total_count FROM (
                SELECT DISTINCT ON (barcode) 1
                FROM scans
                WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)}
                AND product_exists = true
              ) AS recent_scans
            SQL

            total_count_result = ActiveRecord::Base.connection.exec_query(count_query)
            total_count = total_count_result.first["total_count"]

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

          # 1. Get product IDs sorted by scan count, with pagination
          sql = <<-SQL.squish
                    SELECT product_id
                    FROM (
                      SELECT DISTINCT ON (product_id) product_id, created_at
                      FROM scans
                      WHERE product_id IS NOT NULL
                      ORDER BY product_id, created_at DESC
                    ) t
                      ORDER BY t.created_at DESC
                    LIMIT ? OFFSET ?
          SQL

          product_ids_query = ActiveRecord::Base.sanitize_sql_array([sql, per_page, offset])
          product_ids = ActiveRecord::Base.connection.select_values(product_ids_query)

          # 2. Total count of unique products with scans
          count_query = <<-SQL.squish
            SELECT COUNT(DISTINCT scans.product_id)
            FROM scans
            WHERE scans.product_id IS NOT NULL
          SQL

          total_count = ActiveRecord::Base.connection.select_value(count_query).to_i
        
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



        # def self.recent_scan_products(per_page, page)
        #   per_page = per_page.to_i
        #   page = page.to_i
        #   offset = (page - 1) * per_page

        #   sql = <<-SQL.squish
        #             SELECT product_id
        #             FROM (
        #               SELECT DISTINCT ON (product_id) product_id, created_at
        #               FROM scans
        #               WHERE product_id IS NOT NULL
        #               ORDER BY product_id, created_at DESC
        #             ) t
        #               ORDER BY t.created_at DESC
        #             LIMIT ? OFFSET ?
        #   SQL

        #   recent_scans_sql = <<-SQL.squish
        #                           SELECT *
        #                           FROM (
        #                             SELECT DISTINCT ON (barcode) *
        #                             FROM scans
        #                             WHERE product_exists = true
        #                           ) AS deduped
        #                           ORDER BY created_at DESC
        #                           LIMIT #{per_page} OFFSET #{offset}
        #                         SQL

        #   recent_scan_data = Domains::CroupierCore::Scan.find_by_sql(recent_scans_sql)

        #   product_ids = recent_scan_data.map(&:product_id).compact

        #   count_query = <<-SQL.squish
        #     SELECT COUNT(DISTINCT scans.product_id)
        #     FROM scans
        #     WHERE scans.product_id IS NOT NULL
        #   SQL

        #   total_count = ActiveRecord::Base.connection.select_value(count_query).to_i
        
        #     ids = product_ids.map(&:to_i).join(", ")

        #     scan_counts_query = <<-SQL.squish
        #       SELECT product_id, COUNT(*) AS scan_count
        #       FROM scans
        #       WHERE product_id IN (#{ids})
        #       GROUP BY product_id
        #     SQL

        #     scan_counts = ActiveRecord::Base.connection.exec_query(scan_counts_query)
        #     product_scan_counts = scan_counts.to_a.to_h { |r| [r["product_id"], r["scan_count"]] }

        #     product_variants = unscoped_products_with_assoc("product_id", product_ids)
            
        #    barcode_hash = {} 
        #     product_variants.each do |pv|
        #         barcode_hash[pv.barcode] = {
        #           scan_count: product_scan_counts[pv.product_id] || 0,
        #           product_variant: pv,
        #           media: pv.media
        #         }
        #     end

        #     records = recent_scan_data.map do |scn|
        #       {
        #         scan: scn,
        #         product_data: barcode_hash[scn.barcode]
        #       }
        #     end
        #   PaginatedResult.new(records, per_page, page, total_count)
        # end



        def self.top_scan_products(per_page, page)
          per_page = per_page.to_i
          page = page.to_i
          offset = (page - 1) * per_page

          # 1. Get product IDs sorted by scan count, with pagination
          product_ids_query = <<-SQL.squish
            SELECT 
              products.id
            FROM 
              scans
            JOIN 
              products ON products.id = scans.product_id
            GROUP BY 
              products.id
            ORDER BY 
              COUNT(scans.id) DESC
            LIMIT #{per_page} OFFSET #{offset}
          SQL

          product_ids = ActiveRecord::Base.connection.select_values(product_ids_query)

          # 2. Total count of unique products with scans
          count_query = <<-SQL.squish
            SELECT COUNT(*) FROM (
              SELECT products.id
              FROM scans
              JOIN products ON products.id = scans.product_id
              GROUP BY products.id
            ) AS product_counts
          SQL

          total_count = ActiveRecord::Base.connection.select_value(count_query).to_i

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
          order_clause = Arel.sql(
            "CASE #{values.each_with_index.map do |v, i|
    "WHEN #{attribute_key} = #{ActiveRecord::Base.connection.quote(v)} THEN #{i}"
            end.join(' ')} ELSE #{values.length} END"
          )

          Domains::Products::ProductVariant.unscoped
                                           .includes(:media)
                                           .left_outer_joins(:media, product: [:company, :reviews])
                                           .select(
                                             'product_variants.*',
                'products.id AS product_id',
                'products.name AS product_name',
                'products.description AS product_description',
                'products.searches AS searches',
                'products.company_id AS product_company_id',
                'companies.name AS company_name',
                'AVG(reviews.rating) AS avrg_rating'
                                           )
                                           .where("#{attribute_key}": values)
                                           .group(
                                             'products.id',
                'products.name',
                'products.description',
                'products.company_id',
                'product_variants.id',
                'companies.name'
                                           )
                                           .order(order_clause)
        end
    end
  end
end