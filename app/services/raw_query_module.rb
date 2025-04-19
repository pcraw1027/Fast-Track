module RawQueryModule

  def self.my_top_scan_products(limit, current_user_id)
    query = <<-SQL
    WITH recent_scans AS (
      SELECT DISTINCT ON (barcode) *
      FROM scans
      WHERE user_id = #{ActiveRecord::Base.connection.quote(current_user_id)} AND product_exists = true
      ORDER BY barcode, created_at DESC
    )
    SELECT products.*, recent_scans.*, product_variants.*
    FROM products
    JOIN product_variants ON product_variants.product_id = products.id
    JOIN recent_scans ON recent_scans.barcode = product_variants.barcode
    LIMIT #{limit}
   SQL
  
   Product.find_by_sql(query) 
  end

  def self.top_scan_products(limit)
    query = <<-SQL
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
                LIMIT #{limit}
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
            SQL

      Product.find_by_sql(query)
  end

end