require 'uri'
require 'open-uri'
require 'fileutils'

module Domains
  module CroupierCore
    module CitLookupUtils


      # Ensures temporary files are always cleaned up.
      def self.resolve_records(cit:, company:, brick:)

        # Temporary directory for image downloads
        temp_dir = Rails.root.join(
          "tmp",
          "media_ups_item_db_image",
          Time.now.to_i.to_s
        )
        FileUtils.mkdir_p(temp_dir)

        begin
           company_data =
              Domains::CroupierCore::GoogleGeminiCitLookup
                .generate_company_data(company_name: company.name, brick_title: brick.title)

          # If no product data is found, mark cIT as failed
          if company_data.nil? || company_data["naics"].blank?
            puts "No company data found for #{company.name}"
            cit.update(capture_status: 5)
          else
            # Log retrieved metadata
            puts "company data found:"
            puts "#{company_data.inspect}"
            
            naics = company_data["naics"]
            naics = naics&.to_s&.gsub(/\s+/, "")&.rjust(6, "0")

            ind = Domains::Companies::IndustryCategoryType.find_by(
              category_code: naics
            )

            company.industry_category_type_id = ind.id if ind

            company.website = company_data["website"]
            company.black_owned = company_data["black_owned"] == "Yes" ? true : false
            company.female_owned = company_data["woman_owned"] == "Yes" ? true : false
            company.established = Date.new(company_data["year_established"].to_i)

            # Download and attach product image if available
            if company_data[:logo_url]
              image_path =
                process_remote_file(
                  remote_url: company_data[:logo_url],
                  temp_dir: temp_dir
                )

              if File.exist?(image_path)
                  company.logo = File.open(image_path)
              end
            end

            company.save!

            # Mark cIT as successfully captured
            cit.update(
              capture_status: 3,
              company_id: company.id
            )

            # # Record capture history
            # Domains::CroupierCore::CaptureHistory.create!(
            #   third_party_source: "UPC Item DB",
            #   status: 1,
            #   barcode: cit.barcode,
            #   name: p_title
            # )
          end

        rescue => e
         puts e
          puts "Error: #{e.message}"
            # No fallback possible → mark cIT as failed
            cit.update(capture_status: 5)
     

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
