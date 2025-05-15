module RawQueryModule

    def self.my_scan_products(per_page, page, current_user_id)
        per_page = per_page.to_i
        page = page.to_i
        offset = (page - 1) * per_page

         #select and paginate scans
        recent_scans_sql = <<-SQL
          SELECT DISTINCT ON (barcode) *
          FROM scans
          WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)}
            AND product_exists = true
          ORDER BY barcode, created_at DESC
          LIMIT #{per_page} OFFSET #{offset}
        SQL

        recent_scans = Scan.find_by_sql(recent_scans_sql)


        #count product scans on matched products
        product_ids = recent_scans.map(&:product_id).compact
        scan_counts_query = <<-SQL
          SELECT product_id, COUNT(*) AS scan_count
          FROM scans
          WHERE product_id IN (#{product_ids.join(',')})
          GROUP BY product_id
        SQL

        scan_counts = ActiveRecord::Base.connection.exec_query(scan_counts_query)
        product_scan_counts = scan_counts.rows.to_h

        #load product_variants data
        product_variants = ProductVariant
              .left_outer_joins(product: :company)
              .select(
                'product_variants.*',
                'products.id AS product_id',
                'products.name AS product_name',
                'products.description AS product_description',
                'products.company_id AS product_company_id',
                'companies.name AS company_name'
              )
              .where(barcode: recent_scans.map(&:barcode))
              .order('product_variants.created_at DESC')
              .limit(per_page)
              .offset(offset)


        count_query = <<-SQL
          SELECT COUNT(*) AS total_count FROM (
            SELECT DISTINCT ON (barcode) 1
            FROM scans
            WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)}
              AND product_exists = true
            ORDER BY barcode, created_at DESC
          ) AS recent_scans
        SQL

        total_count_result = ActiveRecord::Base.connection.exec_query(count_query)
        total_count = total_count_result.first["total_count"]

        #scan_map = recent_scans.index_by(&:barcode)

        records = product_variants.map do |pv|
          {
            avrg_rating: 4.5,
            scan_count: product_scan_counts[pv.product_id] || 0,
            product_variant: pv
          }
        end

        PaginatedResult.new(records, per_page, page, total_count)
      end



    def self.top_scan_products(per_page, page)
      per_page = per_page.to_i
      page = page.to_i
      offset = (page - 1) * per_page

      count_query = <<-SQL
        WITH ranked_scans AS (
          SELECT 
            scans.barcode,
            MAX(pit_records.product_activity_count) AS max_activity_count
          FROM 
            scans
          JOIN 
            pit_records ON pit_records.barcode = scans.barcode
          WHERE 
            pit_records.level >= 1
          GROUP BY 
            scans.barcode
        )
        SELECT COUNT(*) AS total_count FROM ranked_scans
      SQL

      total_count_result = ActiveRecord::Base.connection.exec_query(count_query)
      total_count = total_count_result.first["total_count"]

      data_query = <<-SQL
        WITH ranked_scans AS (
          SELECT 
            scans.barcode,
            MAX(pit_records.product_activity_count) AS max_activity_count
          FROM 
            scans
          JOIN 
            pit_records ON pit_records.barcode = scans.barcode
          WHERE 
            pit_records.level >= 1
          GROUP BY 
            scans.barcode
          ORDER BY 
            max_activity_count DESC
        )
        SELECT 
          scans.*, 
          ranked_scans.barcode AS ranked_barcode
        FROM 
          ranked_scans
        JOIN 
          product_variants ON product_variants.barcode = ranked_scans.barcode
        JOIN 
          products ON products.id = product_variants.product_id
        JOIN 
          scans ON scans.barcode = ranked_scans.barcode
        LIMIT #{per_page} OFFSET #{offset}
      SQL

      recent_scans = Scan.find_by_sql(data_query)

       #count product scans on matched products
        product_ids = recent_scans.map(&:product_id).compact
        scan_counts_query = <<-SQL
          SELECT product_id, COUNT(*) AS scan_count
          FROM scans
          WHERE product_id IN (#{product_ids.join(',')})
          GROUP BY product_id
        SQL

        scan_counts = ActiveRecord::Base.connection.exec_query(scan_counts_query)
        product_scan_counts = scan_counts.rows.to_h

        #load product_variants data
        product_variants = ProductVariant
            .left_outer_joins(product: :company)
            .select(
              'product_variants.*',
              'products.id AS product_id',
              'products.name AS product_name',
              'products.description AS product_description',
              'products.company_id AS product_company_id',
              'companies.name AS company_name'
            )
            .where(barcode: recent_scans.map(&:barcode))
            .order('product_variants.created_at DESC')
            .limit(per_page)
            .offset(offset)

          
      records = product_variants.map do |pv|
          {
            avrg_rating: 4.5,
            scan_count: product_scan_counts[pv.product_id] || 0,
            product_variant: pv
          }
        end

      PaginatedResult.new(records, per_page, page, total_count)
    end

  
end