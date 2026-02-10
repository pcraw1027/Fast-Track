module Domains
  module CroupierCore
    module ActivityStats

      # Returns aggregated platform activity stats:
      # - total vs current-month scans
      # - total vs current-month uploads
      # - total vs current-month products
      # - total vs current-month companies
      #
      # All product-related metrics enforce:
      # - product exists and is valid
      # - product has media
      # - PIT record is captured (capture_status = 0)
      def self.current_stats
        # Define current month date range
        start_date = Time.current.beginning_of_month
        end_date   = Time.current.end_of_month

        # -----------------------------------
        # SCANS (overall)
        # -----------------------------------
        # Counts all valid scans tied to valid products
        # DISTINCT is required due to join fan-out (variants, media, pit_records)
        total_scans =
          Domains::CroupierCore::Scan
            .joins(product: [{ product_variants: :media }, :pit_records])
            .where(pit_records: { capture_status: 0 })
            .where(product_exists: true)
            .where.not(scans: { product_id: nil })
            .where(
              "products.name IS NOT NULL AND products.name != '' AND
               products.description IS NOT NULL AND products.description != '' AND
               products.company_id IS NOT NULL"
            )
            .count("DISTINCT scans.id")

        # -----------------------------------
        # SCANS (current month)
        # -----------------------------------
        total_scans_monthly =
          Domains::CroupierCore::Scan
            .joins(product: [{ product_variants: :media }, :pit_records])
            .where(pit_records: { capture_status: 0 })
            .where(product_exists: true)
            .where.not(scans: { product_id: nil })
            .where(
              "products.name IS NOT NULL AND products.name != '' AND
               products.description IS NOT NULL AND products.description != '' AND
               products.company_id IS NOT NULL"
            )
            .where(created_at: start_date..end_date)
            .count("DISTINCT scans.id")

        # -----------------------------------
        # UPLOADS
        # -----------------------------------
        total_uploads =
          Domains::CroupierCore::UploadRecord.count

        total_uploads_monthly =
          Domains::CroupierCore::UploadRecord
            .where(created_at: start_date..end_date)
            .count

        # -----------------------------------
        # PRODUCTS (overall)
        # -----------------------------------
        # Counts unique products that:
        # - are captured (PIT capture_status = 0)
        # - have media
        # - have valid name, description, and company
        total_products =
          Domains::CroupierCore::PitRecord
            .joins(product: { product_variants: :media }) # enforce product has media
            .where(capture_status: 0)
            .where.not(
              products: {
                id: nil,
                name: [nil, ""],
                description: [nil, ""],
                company_id: nil
              }
            )
            .count("DISTINCT pit_records.product_id")

        # -----------------------------------
        # PRODUCTS (current month)
        # -----------------------------------
        # Uses product creation date, not PIT record date
        total_products_monthly =
          Domains::CroupierCore::PitRecord
            .joins(product: { product_variants: :media })
            .where(capture_status: 0)
            .where.not(
              products: {
                id: nil,
                name: [nil, ""],
                description: [nil, ""],
                company_id: nil
              }
            )
            .where(products: { created_at: start_date..end_date })
            .count("DISTINCT pit_records.product_id")

        # -----------------------------------
        # COMPANIES
        # -----------------------------------
        total_companies =
          Domains::Companies::Company.count

        total_companies_monthly =
          Domains::Companies::Company
            .where(created_at: start_date..end_date)
            .count

        # -----------------------------------
        # Final response payload
        # -----------------------------------
        [
          {
            type: "scans",
            currentMonth: total_scans_monthly,
            overall: total_scans
          },
          {
            type: "uploads",
            currentMonth: total_uploads_monthly,
            overall: total_uploads
          },
          {
            type: "products",
            currentMonth: total_products_monthly,
            overall: total_products
          },
          {
            type: "companies",
            currentMonth: total_companies_monthly,
            overall: total_companies
          }
        ]
      end
    end
  end
end
