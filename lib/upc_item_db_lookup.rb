require 'net/http'
require 'uri'
require 'json'
require "open-uri"
require "time"


class UpcItemDbLookup

     BARCODES=[]

    def initialize
        p "==========================================================="
        p "UPC ITEM DB Capture running...."
        p "==========================================================="

        @response_data = []
           
            BARCODES.each_with_index do |barcode, index|
                begin
                    lookup_barcode(barcode)

                rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
                    puts "UPCitemDB rate limited. Waiting before retry..."

                    sleep 30
                    retry

                rescue StandardError => e
                    puts "Lookup failed for barcdoe #{barcode}: #{e.message}"
                end

                unless index == BARCODES.length - 1
                    sleep 15 # 4 requests/minute safety
                else
                    #here's the last item. Done performing upc item lookup
                    timestamp = Time.now.utc.strftime("%Y%m%d_%H%M%S")
                    File.write("upc-item-db-data-#{timestamp}.json", JSON.pretty_generate(@response_data))
                    p "==========================================================="
                    p "captured data written to upc-item-db-data-#{timestamp}.json"
                    p "==========================================================="
                end
            end
          end


          def lookup_barcode(barcode)
            begin
                product_data = lookup_upc_item_db(barcode)

                if product_data.nil?
                    puts "No product data found for UPC #{barcode}"
                else
                    image_url = product_data[:images]&.first
                    puts "Product data found:"
                    puts "Barcode: #{barcode}"
                    puts "Title: #{product_data[:title]}"
                    puts "Brand: #{product_data[:brand]}"
                    puts "Images: #{image_url}"
                    
                    @response_data.push({
                        title: product_data[:title],
                        brand: product_data[:brand],
                        image_url: image_url,
                        barcode: barcode
                    })
                end
            rescue => e
                puts "Error: #{e.message}"
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

end

UpcItemDbLookup.new