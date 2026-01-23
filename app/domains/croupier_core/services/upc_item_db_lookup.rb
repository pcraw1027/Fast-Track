require 'net/http'
require 'uri'
require 'json'

module Domains
  module CroupierCore
      module UpcItemDbLookup

        def self.lookup_upc_item_db(barcode:)
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
                    image_url: item['images']&.first
                }
            end

      end
  end
end
