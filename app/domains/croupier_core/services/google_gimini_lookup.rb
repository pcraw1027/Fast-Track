require 'net/http'
require 'uri'
require 'json'

module Domains
  module CroupierCore
    # Module for generating product descriptions using Google Gemini AI
    module GoogleGeminiLookup

      # Generates a concise product description for a given barcode and product name
      #
      # Params:
      # - barcode: String, product UPC or barcode
      # - product_name: String, name of the product
      #
      # Returns:
      # - String: generated product description
      # - Fallback: "No description generated." if something goes wrong
      def self.generate_product_description(barcode:, product_name:)
        # Step 1: Specify the AI model to use
        model = 'gemini-2.5-flash'

        # Step 2: Build the endpoint URL
        endpoint = URI(
          "https://generativelanguage.googleapis.com/v1beta/models/#{model}:generateContent"
        )

        # Step 3: Attach API key as query parameter
        endpoint.query = URI.encode_www_form(key: Rails.application.credentials.google_gimini_api_key)

        # Step 4: Prepare the prompt for the AI
        # - Instructs the model to generate a single, concise paragraph description
        prompt = <<~PROMPT.strip
          Provide a single paragraph, concise, and nicely summarized Product Description similar to Google AI Mode response for barcode #{barcode} and product name #{product_name}.
        PROMPT

        # Step 5: Build the request payload in JSON format
        payload = {
          contents: [
            {
              parts: [{ text: prompt }]
            }
          ]
        }

        # Step 6: Set up HTTPS connection
        http = Net::HTTP.new(endpoint.host, endpoint.port)
        http.use_ssl = true

        # Step 7: Build POST request with proper headers and JSON body
        request = Net::HTTP::Post.new(endpoint.request_uri)
        request['Content-Type'] = 'application/json'
        request.body = JSON.generate(payload)

        # Step 8: Send the request to the Google Gemini API
        response = http.request(request)

        # Step 9: Parse the JSON response
        data = JSON.parse(response.body)
        p "GIMI DATA: #{data.inspect}"  # Debug output for inspection

        # Step 10: Extract generated text from response
        # - Dig into nested structure: candidates -> content -> parts -> text
        data.dig('candidates', 0, 'content', 0, 'parts', 0, 'text') || 'No description generated.'

      # Step 11: Handle JSON parsing errors or HTTP errors gracefully
      rescue JSON::ParserError, Net::HTTPError => e
        p "[Gemini] #{e.message}"
        'No description generated.'
      end

    end
  end
end
