require 'uri'
require 'open-uri'
require 'fileutils'

module Domains
  module CroupierCore
    module LookupUtils

      # Resolves a PIT record into a fully-created Product + Variant + Media.
      #
      # Flow:
      # 1. Optionally fetch product metadata from UPC Item DB
      # 2. Generate AI-based product description (Gemini)
      # 3. Resolve or infer company association
      # 4. Create Product and ProductVariant
      # 5. Download and attach product image (if available)
      # 6. Update PIT capture status and history
      #
      # Ensures temporary files are always cleaned up.
      def self.resolve_records(pit:, product_data: nil, to_resolve: false)
        # Temporary directory for image downloads
        temp_dir = Rails.root.join(
          "tmp",
          "media_ups_item_db_image",
          Time.now.to_i.to_s
        )
        FileUtils.mkdir_p(temp_dir)

        asin     = nil
        p_title  = ""

        begin
          # If not resolving fetch product data from UPC Item DB
          unless to_resolve
            pit.update(capture_status: 4)
            product_data =
              Domains::CroupierCore::UpcItemDbLookup
                .lookup_upc_item_db(barcode: pit.barcode)
          end

          # If no product data is found, mark PIT as failed
          if product_data.nil?
            puts "No product data found for UPC #{pit.barcode}"
            pit.update(capture_status: 5)
          else
            # Log retrieved metadata
            puts "Product data found:"
            puts "Title: #{product_data[:title]}"
            puts "Image URL: #{product_data[:image_url]}"
            puts "Brand: #{product_data[:brand]}"

            # Generate AI-powered product description
            description =
              Domains::CroupierCore::GoogleGeminiLookup
                .generate_product_description(
                  barcode: pit.barcode,
                  product_name: product_data[:title]
                )

            # Attempt to resolve company by normalized brand name
            company_id = nil
            company =
              Domains::Companies::Company.find_by(
                "LOWER(name) = ?",
                product_data[:brand].to_s.strip.downcase
              )

            if company
              company_id = company.id
            else
              # If company does not exist, store brand as ASIN placeholder
              # (future: spawn company from CIT workflow)
              asin = product_data[:brand]
            end

            # Normalize product title capitalization
            p_title =
              product_data[:title]
                .split(" ")
                .map(&:capitalize)
                .join(" ")

            # Create Product record
            product =
              Domains::Products::Product.create!(
                name: p_title,
                description: description,
                company_id: company_id
              )

            # Create Product Variant using PIT barcode
            pv =
              Domains::Products::ProductVariant.create!(
                barcode: pit.barcode,
                product_id: product.id
              )

            # Download and attach product image if available
            if product_data[:image_url]
              image_path =
                process_remote_file(
                  remote_url: product_data[:image_url],
                  temp_dir: temp_dir
                )

              if File.exist?(image_path)
                pv.media.create!(
                  file: File.open(image_path),
                  media_type: :image,
                  position: 0
                )
              end
            end

            # Mark PIT as successfully captured
            pit.update(
              capture_status: 3,
              product_id: product.id,
              asin: asin
            )

            # Record capture history
            Domains::CroupierCore::CaptureHistory.create!(
              third_party_source: "UPC Item DB",
              status: 1,
              barcode: pit.barcode,
              name: p_title
            )
          end

        rescue => e
          # Failure fallback:
          # If a ProductVariant already exists for the barcode,
          # link PIT to it instead of failing hard
          puts "Error: #{e.message}"

          pv = Domains::Products::ProductVariant.find_by(barcode: pit.barcode)

          if pv
            pit.update(
              capture_status: 3,
              asin: asin,
              product_id: pv.product_id
            )

            Domains::CroupierCore::CaptureHistory.create!(
              third_party_source: "UPC Item DB",
              status: 1,
              barcode: pit.barcode,
              name: p_title
            )
          else
            # No fallback possible → mark PIT as failed
            pit.update(capture_status: 5)
          end

        ensure
          # Always clean up temporary files
          if Dir.exist?(temp_dir)
            FileUtils.remove_entry_secure(temp_dir)
            p "🧹 Cleaned up temporary directory"
          end
        end
      end

      # Downloads a remote file into a local temporary directory.
      #
      # - Sanitizes filename
      # - Preserves original file content
      # - Returns local file path
      def self.process_remote_file(remote_url:, temp_dir:)
        puts "🌐 Remote file URL: #{remote_url}"

        original_filename =
          File.basename(URI.parse(remote_url).path)

        sanitized_filename =
          original_filename.gsub(/[^\w.\-]/, "_")

        local_input_path =
          File.join(temp_dir, sanitized_filename)

        # Download remote file
        URI.open(remote_url, "rb") do |remote_file|
          File.open(local_input_path, "wb") do |f|
            IO.copy_stream(remote_file, f)
          end
        end

        puts "✅ Downloaded to: #{local_input_path}"
        local_input_path
      end

    end
  end
end
