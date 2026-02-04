require 'uri'
require "open-uri"
require "fileutils"

module Domains
  module CroupierCore
      module LookupUtils

        def self.resolve_records(pit:, product_data: nil, to_resolve: false)
            temp_dir = Rails.root.join("tmp", "media_ups_item_db_image", Time.now.to_i.to_s)
            FileUtils.mkdir_p(temp_dir)
            asin = nil
            p_title = ""

            begin
                unless to_resolve
                    pit.update(capture_status: 4)
                    product_data = Domains::CroupierCore::UpcItemDbLookup.lookup_upc_item_db(barcode: pit.barcode)
                end

                if product_data.nil?  
                    puts "No product data found for UPC #{pit.barcode}"
                    pit.update(capture_status: 5)
                else
                    puts "Product data found:"
                    puts "Title: #{product_data[:title]}"
                    puts "Image URL: #{product_data[:image_url]}"
                    puts "Brand: #{product_data[:brand]}"

                    description = Domains::CroupierCore::GoogleGeminiLookup.generate_product_description(
                                                                    barcode: pit.barcode, 
                                                                product_name: product_data[:title])
                    
                    company_id = nil
                    
                    company = Domains::Companies::Company.find_by("LOWER(name) = ?", product_data[:brand].to_s.strip.downcase)

                    if company 
                        company_id = company.id
                    else
                        asin = product_data[:brand]
                        # mid = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: pit.barcode).payload
                        # cit_rec = Domains::CroupierCore::CitRecord.find_by(mid: mid)
                        # admin = Domains::Users::User.find_by(email: "oshanani@gmail.com")
                        # company_id = Domains::Companies::Company.spawn_new_instance(cit_rec, product_data[:brand], admin.id)
                        
                    end

                    p_title = product_data[:title].split(" ").map(&:capitalize).join(" ")

                    product = Domains::Products::Product.create!(
                        name: p_title,
                        description: description,
                        company_id: company_id
                    )

                    #process and store product image
                    pv = Domains::Products::ProductVariant.create!(
                        barcode: pit.barcode,
                        product_id: product.id
                    )
                    if product_data[:image_url]
                        image_path = process_remote_file(
                            remote_url: product_data[:image_url], temp_dir: temp_dir)
                        puts "*************  image_path: #{image_path}"
                        if File.exist?(image_path)
                            puts "*************  File Path Exists!!!"
                            pv.media.create!(
                                file: File.open(image_path),
                                media_type: :image,
                                position: 0
                            )
                        end
                    end

                    pit.update(capture_status: 3, product_id: product.id, asin: asin)

                    Domains::CroupierCore::CaptureHistory.create!(
                        third_party_source: "UPC Item DB", status: 1, 
                        barcode: pit.barcode, name: p_title
                    )

                   end
                rescue => e
                    puts "Error: #{e.message}"
                      pv = Domains::Products::ProductVariant.find_by(barcode: pit.barcode)
                      if pv
                        pit.update(capture_status: 3, asin: asin, product_id: pv.product_id)

                        Domains::CroupierCore::CaptureHistory.create!(
                            third_party_source: "UPC Item DB", status: 1, 
                            barcode: pit.barcode, name: p_title
                        )
                      else
                        pit.update(capture_status: 5)
                      end

                ensure
                    if Dir.exist?(temp_dir)
                        FileUtils.remove_entry_secure(temp_dir)
                        p "🧹 Cleaned up temporary directory"
                    end
                end

          end

        def self.process_remote_file(remote_url:, temp_dir:)
            puts "🌐 Remote file URL: #{remote_url}"

            original_filename = File.basename(URI.parse(remote_url).path)
            sanitized_filename = original_filename.gsub(/[^\w.\-]/, "_")
            local_input_path = File.join(temp_dir, sanitized_filename)

            # 1️⃣ Download original file
            URI.open(remote_url, "rb") do |remote_file|
                File.open(local_input_path, "wb") { |f| IO.copy_stream(remote_file, f) }
            end
            puts "✅ Downloaded to: #{local_input_path}"
            local_input_path   
        end

      end
  end
end
