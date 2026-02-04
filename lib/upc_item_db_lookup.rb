require 'net/http'
require 'uri'
require 'json'
require "time"

class UpcItemDbLookup

    def initialize
        p "==========================================================="
        p "UPC ITEM DB Capture running...."
        p "==========================================================="

        @response_data = []
        @no_data_found = []

        barcodes = fetch_barcodes()
            p "Looking up #{barcodes.length} barcodes...."
            barcodes.each_with_index do |barcode, index|
                begin
                    lookup_barcode(barcode)

                rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
                    puts "UPCitemDB rate limited. Waiting before retry..."

                    sleep 30
                    retry

                rescue StandardError => e
                    puts "Lookup failed for barcdoe #{barcode}: #{e.message}"
                end

                unless index == barcodes.length - 1
                    sleep 15 # 4 requests per minute safety
                else
                    #resolve failed lookups
                    if @no_data_found.any?
                        resolve_upc_item_data(barcodes: @no_data_found)
                        @no_data_found = []
                    end

                    timestamp = Time.now.utc.strftime("%Y%m%d_%H%M%S")
                    @response_data.each_slice(4) do |group|
                            resolve_upc_item_data(data: group)
                            p "==========================================================="
                            p "resolved #{group.length} chuncks, sleeping for 15 seconds.... "
                            p "==========================================================="
                            sleep 15
                    end
                    p "==========================================================="
                    p "captured data #{timestamp} "
                    p "==========================================================="
                end
            end
          end


          def lookup_barcode(barcode)
            begin
                product_data = lookup_upc_item_db(barcode)

                if product_data.nil?
                    puts "No product data found for UPC #{barcode}"
                    @no_data_found.push(barcode)
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
                @no_data_found.push(barcode)
                puts "Error: #{e.message}"
            end
          end

          def resolve_upc_item_data(data: [], barcodes: [])
            p "Resolving records...."
            uri = URI("https://fast.track.croupier147.com/api/v1/resolve_requested_lookups")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            request = Net::HTTP::Post.new(uri)
            request['Content-Type'] = 'application/json'
            request['Connection'] = 'keep-alive'
            payload = {
                        product_data: {
                            attributes: data,
                            unfound_barcodes: barcodes
                        }
                      }

            request.body = JSON.generate(payload)

            response = http.request(request)

            unless response.is_a?(Net::HTTPSuccess)
                raise "HTTP Error: #{response.code} - #{response.message}"
            end

            puts response.code
            puts response.body
            
        end

        def fetch_barcodes
            p "Fetching barcodes...."
            uri = URI("https://fast.track.croupier147.com/api/v1/barcodes_for_lookup")
            uri.query = URI.encode_www_form({ count: 10 })

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            request = Net::HTTP::Get.new(uri.request_uri)
            request['Accept'] = 'application/json'
            request['Connection'] = 'keep-alive'

            response = http.request(request)

            unless response.is_a?(Net::HTTPSuccess)
                raise "HTTP Error: #{response.code} - #{response.message}"
            end

            data = JSON.parse(response.body)
            p data
            data
        end


         def lookup_upc_item_db(barcode)
            uri = URI("https://api.upcitemdb.com/prod/trial/lookup")
            uri.query = URI.encode_www_form({ upc: barcode })

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            request = Net::HTTP::Get.new(uri.request_uri)
            request['Accept'] = 'application/json'
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

