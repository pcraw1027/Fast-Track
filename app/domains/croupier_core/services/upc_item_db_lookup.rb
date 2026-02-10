require 'net/http'
require 'uri'
require 'json'

module Domains
  module CroupierCore
    module UpcItemDbLookup

      # Looks up product information from UPC Item DB API using a barcode
      #
      # Params:
      # - barcode: String, UPC barcode of the product
      #
      # Returns:
      # - Hash with product details: { title, brand, image_url } 
      # - Returns nil if no item is found
      #
      # Raises:
      # - RuntimeError if HTTP request fails or API returns an error code
      def self.lookup_upc_item_db(barcode:)
        # Step 1: Build the API URL with query parameter
        uri = URI("https://api.upcitemdb.com/prod/trial/lookup")
        uri.query = URI.encode_www_form({ upc: barcode })

        # Step 2: Setup HTTP connection
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true  # UPC Item DB API uses HTTPS

        # Step 3: Build GET request with headers
        request = Net::HTTP::Get.new(uri.request_uri)
        request['Accept'] = 'application/json'
        request['User-Agent'] = 'FastTrack/1.0 (contact: pcraw1027@gmail.com)'
        request['Accept-Language'] = 'en-US'
        request['Connection'] = 'keep-alive'

        # Step 4: Execute the HTTP request
        response = http.request(request)

        # Step 5: Raise error if response is not 2xx
        unless response.is_a?(Net::HTTPSuccess)
          raise "HTTP Error: #{response.code} - #{response.message}"
        end

        # Step 6: Parse JSON response body
        data = JSON.parse(response.body)

        # Step 7: Check API-level success
        if data['code'] != 'OK'
          raise "API Error: #{data['code']} - #{data['message']}"
        end

        # Step 8: Get the first item from the response
        item = data.dig('items', 0)
        return nil unless item  # Return nil if no items found

        # Step 9: Return relevant product info
        {
          title: item['title'],
          brand: item['brand'],
          # category: item['category'],  # Optional, can be added if needed
          image_url: item['images']&.first  # Use first image if available
        }
      end

    end
  end
end
