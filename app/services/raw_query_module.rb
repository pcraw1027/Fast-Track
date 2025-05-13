module RawQueryModule

    def self.my_scan_products(per_page, page, current_user_id)
      per_page = per_page.to_i
      page = page.to_i
      offset = (page - 1) * per_page

      sanitized_user_id = ActiveRecord::Base.connection.quote(current_user_id)


      count_query = <<-SQL
        WITH recent_scans AS (
          SELECT DISTINCT ON (barcode) *
          FROM scans
          WHERE user_id = #{sanitized_user_id} AND product_exists = true
          ORDER BY barcode, created_at DESC
        )
        SELECT COUNT(*) AS total_count
        FROM product_variants
        JOIN recent_scans ON recent_scans.barcode = product_variants.barcode
      SQL

      total_count_result = ActiveRecord::Base.connection.exec_query(count_query)
      total_count = total_count_result.first["total_count"]


      data_query = <<-SQL
        WITH recent_scans AS (
          SELECT DISTINCT ON (barcode) *
          FROM scans
          WHERE user_id = #{sanitized_user_id} AND product_exists = true
          ORDER BY barcode, created_at DESC
        )
        SELECT products.*, recent_scans.*, product_variants.*
        FROM products
        JOIN product_variants ON product_variants.product_id = products.id
        JOIN recent_scans ON recent_scans.barcode = product_variants.barcode
        LIMIT #{per_page} OFFSET #{offset}
      SQL

      records = Product.find_by_sql(data_query)

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
          products.*, 
          product_variants.*, 
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

      records = Product.find_by_sql(data_query)

      PaginatedResult.new(records, per_page, page, total_count)
    end

  # def self.my_scan_products(limit, page, current_user_id)
  #   query = <<-SQL
  #   WITH recent_scans AS (
  #     SELECT DISTINCT ON (barcode) *
  #     FROM scans
  #     WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)} AND product_exists = true
  #     ORDER BY barcode, created_at DESC
  #   )
  #   SELECT products.*, recent_scans.*, product_variants.*
  #   FROM products
  #   JOIN product_variants ON product_variants.product_id = products.id
  #   JOIN recent_scans ON recent_scans.barcode = product_variants.barcode
  #   LIMIT #{limit}
  #  SQL
  
  #  Product.find_by_sql(query) 
  # end


  # def self.top_scan_products(limit, page)
  #   query = <<-SQL
  #             WITH ranked_scans AS (
  #               SELECT 
  #                 scans.barcode,
  #                 MAX(pit_records.product_activity_count) AS max_activity_count
  #               FROM 
  #                 scans
  #               JOIN 
  #                 pit_records ON pit_records.barcode = scans.barcode
  #               WHERE 
  #                 pit_records.level >= 1
  #               GROUP BY 
  #                 scans.barcode
  #               ORDER BY 
  #                 max_activity_count DESC
  #               LIMIT #{limit}
  #             )
  #             SELECT 
  #               products.*, 
  #               product_variants.*, 
  #               scans.*, 
  #               ranked_scans.barcode AS ranked_barcode
  #             FROM 
  #               ranked_scans
  #             JOIN 
  #               product_variants ON product_variants.barcode = ranked_scans.barcode
  #             JOIN 
  #               products ON products.id = product_variants.product_id
  #             JOIN 
  #               scans ON scans.barcode = ranked_scans.barcode
  #           SQL

  #     Product.find_by_sql(query)
  # end

end