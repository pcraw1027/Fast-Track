module Domains
  module CroupierCore
    module RawQueryModule

      # Returns paginated scan products for a specific user, including product variant and media info.
      #
      # Params:
      # - per_page: number of items per page
      # - page: current page number
      # - current_user_id: ID of the user whose scans are fetched
      #
      # Flow:
      # 1. Fetch recent scans for the user, ensuring products are valid and PIT records are active
      # 2. Count total scans per product
      # 3. Load product variant and associated media
      # 4. Build hash mapping barcode → scan count + variant + media
      # 5. Assemble final records and wrap in a PaginatedResult
      def self.my_scan_products(per_page, page, current_user_id)
        per_page = per_page.to_i
        page = page.to_i
        offset = (page - 1) * per_page

        # Step 1: Fetch recent scans for this user
        recent_scan_data = Domains::CroupierCore::Scan
          .joins(product: [{ product_variants: :media }, :pit_records ]) 
          .where(pit_records: { capture_status: 0 })       # Only active PIT records
          .where(product_exists: true, user_id: current_user_id)
          .where.not(scans: { product_id: nil })           # Ensure scan is linked to a product
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .select("scans.*")
          .distinct("scans.id")                            # Avoid duplicates
          .order("scans.created_at DESC")                  # Most recent first
          .limit(per_page)
          .offset(offset)

        # Step 2: Count scans per product
        product_ids = recent_scan_data.map(&:product_id)
        product_scan_counts = get_scan_count(product_ids)

        # Step 3: Load product variants along with media & associations
        product_variants = unscoped_products_with_assoc("barcode", recent_scan_data.map(&:barcode))
        
        # Step 4: Compute total scan count for pagination
        total_count = Domains::CroupierCore::Scan
          .joins(product: [{ product_variants: :media }, :pit_records ]) 
          .where(pit_records: { capture_status: 0 })
          .where(product_exists: true, user_id: current_user_id)
          .where.not(scans: { product_id: nil })
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .distinct("scans.id")
          .count("DISTINCT scans.id")

        # Step 5: Map barcode → {scan_count, product_variant, media}
        barcode_hash = {} 
        product_variants.each do |pv|
          barcode_hash[pv.barcode] = {
            scan_count: product_scan_counts[pv.product_id] || 0,
            product_variant: pv,
            media: pv.media
          }
        end

        # Step 6: Build final records array
        records = recent_scan_data.map do |scn|
          {
            scan: scn,
            product_data: barcode_hash[scn.barcode]
          }
        end

        PaginatedResult.new(records, per_page, page, total_count)
      end

      # Returns paginated list of recent scan products (latest scan per product)
      #
      # Flow:
      # 1. Select DISTINCT ON product_id to get latest scan per product
      # 2. Join associated product variant & media
      # 3. Count total unique products for pagination
      # 4. Map scan counts and variants
      def self.recent_scan_products(per_page, page)
        per_page = per_page.to_i
        page = page.to_i
        offset = (page - 1) * per_page

        # Step 1: Latest scan per product using DISTINCT ON
        latest_scans = Domains::CroupierCore::Scan.unscoped
          .select("DISTINCT ON (scans.product_id) scans.*")
          .order("scans.product_id, scans.created_at DESC")

        # Step 2: Join product associations and filter
        product_ids_query = Domains::CroupierCore::Scan.unscoped
          .from(latest_scans, :scans)
          .joins(product: [{ product_variants: :media }, :pit_records ])
          .where(pit_records: { capture_status: 0 })
          .where(product_exists: true)
          .where.not(scans: { product_id: nil })
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .order("scans.created_at DESC")
          .limit(per_page)
          .offset(offset)

        product_ids = product_ids_query.map(&:product_id)

        # Step 3: Total count for pagination
        total_count = Domains::CroupierCore::Scan
          .joins(product: [{ product_variants: :media }, :pit_records ]) 
          .where(pit_records: { capture_status: 0 })
          .where(product_exists: true)
          .where.not(scans: { product_id: nil })
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .count("DISTINCT scans.product_id")
        
        # Step 4: Count scans per product
        product_scan_counts = get_scan_count(product_ids)

        # Step 5: Load product variants for the filtered product IDs
        product_variants = unscoped_products_with_assoc("product_id", product_ids)
          
        # Step 6: Map variants with scan counts
        records = product_variants.map do |pv|
          {
            scan_count: product_scan_counts[pv.product_id] || 0,
            product_variant: pv,
            media: pv.media
          }
        end

        PaginatedResult.new(records, per_page, page, total_count)
      end

      # Returns top scanned products sorted by scan count
      #
      # Flow:
      # 1. Aggregate scans per product
      # 2. Group by product_id (and created_at)
      # 3. Join product variants and media
      # 4. Build record array sorted by scan_count descending
      def self.top_scan_products(per_page, page)
        per_page = per_page.to_i
        page = page.to_i
        offset = (page - 1) * per_page

        # Step 1: Aggregate scans per product
        product_ids_query = Domains::CroupierCore::Scan.unscoped
          .joins(product: [{ product_variants: :media }, :pit_records ]) 
          .where(pit_records: { capture_status: 0 })
          .where(product_exists: true)
          .where.not(scans: { product_id: nil })
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .select("scans.product_id AS product_id, COUNT(scans.id) AS scans_count")
          .group("scans.product_id, scans.created_at")
          .order("scans_count DESC")

        product_ids = product_ids_query.map(&:product_id)

        # Step 2: Total count of unique products
        total_count = Domains::CroupierCore::Scan
          .joins(product: [{ product_variants: :media }, :pit_records ]) 
          .where(pit_records: { capture_status: 0 })
          .where(product_exists: true)
          .where.not(scans: { product_id: nil })
          .where(
            "products.name IS NOT NULL AND products.name != '' AND
             products.description IS NOT NULL AND products.description != '' AND
             products.company_id IS NOT NULL"
          )
          .count("DISTINCT scans.product_id")

        # Step 3: Get scan counts
        product_scan_counts = get_scan_count(product_ids)

        # Step 4: Load product variants
        product_variants = unscoped_products_with_assoc("product_id", product_ids)

        # Step 5: Build records array with scan counts and variant info
        records = product_variants.map do |pv|
          {
            scan_count: product_scan_counts[pv.product_id] || 0,
            product_variant: pv,
            media: pv.media
          }
        end

        # Step 6: Sort descending by scan_count
        PaginatedResult.new(records.sort_by { |rec| -(rec[:scan_count] || 0) }, per_page, page, total_count)
      end

      # Returns a hash of product_id => scan_count
      #
      # Executes raw SQL to efficiently count scans per product
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

      # Fetches product variants with associations, filtered by barcode or product_id,
      # and orders them in the same order as the provided list
      def self.unscoped_products_with_assoc(attribute_key, values)
        qualified_attr =
          case attribute_key.to_s
          when "product_id" then "pit_records.product_id"
          when "barcode"    then "pit_records.barcode"
          else
            raise ArgumentError, "Unsupported attribute_key: #{attribute_key}"
          end

        # Determine array type for ORDER BY array_position
        array_type =
          case attribute_key.to_s
          when "product_id" then "bigint[]"
          when "barcode"    then "text[]"
          end

        # Sanitize SQL for array_position ordering
        order_sql = ActiveRecord::Base.send(
          :sanitize_sql_array,
          ["array_position(ARRAY[?]::#{array_type}, #{qualified_attr})", values]
        )

        # Fetch product variants and associations
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
            "#{qualified_attr}",
            "companies.id"
          )
          .order(Arel.sql(order_sql))
      end

    end
  end
end
