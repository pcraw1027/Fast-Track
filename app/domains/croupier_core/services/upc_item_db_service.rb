require 'net/http'
require 'uri'
require 'json'
require "open-uri"
require "fileutils"

module Domains
  module CroupierCore
    class UpcItemDbService < ApplicationService

          def call
            pit_recs = Domains::CroupierCore::PitRecord.for_lookup(100)

            pit_recs.each_with_index do |pit, index|
                begin
                    lookup_pit_rec(pit)

                rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
                    Rails.logger.warn "UPCitemDB rate limited. Waiting before retry..."

                    sleep 30
                    retry

                rescue StandardError => e
                    Rails.logger.error "Lookup failed for PitRecord #{pit.id}: #{e.message}"
                end

                unless index == pit_recs.size - 1
                    sleep 15 # 4 requests/minute safety
                end
            end
          end


          def lookup_pit_rec(pit)
            temp_dir = Rails.root.join("tmp", "media_ups_item_db_image", Time.now.to_i.to_s)
            FileUtils.mkdir_p(temp_dir)
            begin
                pit.update(capture_status: 4)
                product_data = lookup_upc_item_db(pit.barcode)

                if product_data.nil?
                    puts "No product data found for UPC #{pit.barcode}"
                    pit.update(capture_status: 5)
                else
                    image_url = product_data[:images]&.first
                    puts "Product data found:"
                    puts "Title: #{product_data[:title]}"
                    puts "Brand: #{product_data[:brand]}"
                    puts "Images: #{image_url}"

                    description = generate_product_description(barcode: pit.barcode, 
                                                                product_name: product_data[:title])

                    product = Domains::Products::Product.create!(
                        name: product_data[:title],
                        description: description
                    )

                    #process and store product image
                    pv = Domains::Products::ProductVariant.create!(
                        barcode: pit.barcode,
                        product_id: product.id
                    )
                    if image_url
                        image_path = process_remote_file(image_url, temp_dir)
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

                    pit.update(capture_status: 3, asin: product_data[:brand], product_id: product.id)
                   end
                rescue => e
                    puts "Error: #{e.message}"
                    pit.update(capture_status: 5)
                ensure
                    if Dir.exist?(temp_dir)
                        FileUtils.remove_entry_secure(temp_dir)
                        p "🧹 Cleaned up temporary directory"
                    end
                end

          end

          def lookup_upc_item_db(barcode)
            uri = URI("https://api.upcitemdb.com/prod/trial/lookup")
            uri.query = URI.encode_www_form({ upc: barcode })

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            request = Net::HTTP::Get.new(uri.request_uri)
            request['Accept'] = 'application/json'
            request['User-Agent'] = 'FastTrack/1.0 (contact: pcraw1027@gmail.com)'
            request['Accept-Language'] = 'en-US'
            request['Connection'] = 'keep-alive'

            response = http.request(request)

            unless response.is_a?(Net::HTTPSuccess)
                raise "HTTP Error: #{response.code} - #{response.message}"
            end

            data = JSON.parse(response.body)

            if data['code'] != 'OK'
                raise "API Error: #{data['code']} - #{data['message']}"
            end

            item = data.dig('items', 0)
            return nil unless item

            {
                title: item['title'],
                brand: item['brand'],
                #category: item['category'],
                images: item['images'],
            }
            end


            def process_remote_file(remote_url, temp_dir)
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

            def generate_product_description(barcode:, product_name:)
                model = 'gemini-2.5-flash'
                endpoint = URI(
                    "https://generativelanguage.googleapis.com/v1beta/models/#{model}:generateContent"
                )

                endpoint.query = URI.encode_www_form(key: Rails.application.credentials.google_gimini_api_key)

                prompt = <<~PROMPT.strip
                    Provide a single paragraph, concise, and nicely summarized Product Description similar to Google AI Mode response for barcode #{barcode} and product name #{product_name}.
                PROMPT

                payload = {
                    contents: [
                    {
                        parts: [{ text: prompt }]
                    }
                    ]
                }

                http = Net::HTTP.new(endpoint.host, endpoint.port)
                http.use_ssl = true

                request = Net::HTTP::Post.new(endpoint.request_uri)
                request['Content-Type'] = 'application/json'
                request.body = JSON.generate(payload)

                response = http.request(request)
                data = JSON.parse(response.body)

                data.dig('candidates', 0, 'content', 'parts', 0, 'text') ||
                    'No description generated.'
                rescue JSON::ParserError, Net::HTTPError => e
                    p "[Gemini] #{e.message}"
                    'No description generated.'
            end

          
    end
  end
end



