require 'net/http'
require 'uri'
require 'json'

module Domains
  module CroupierCore
    # Module for generating company data using Google Gemini AI
    module GoogleGeminiCitLookup

      
      def self.generate_company_data(company_name:)
        raise ArgumentError, "Company name required" if company_name.blank?
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
            Return structured company data as valid JSON only.

            Company Name: #{company_name}

            Required JSON format:

            {
            "naics": "6 digit string",
            "website": "string",
            "year_established": "4 digit string",
            "logo_url": "string",
            "address": "string",
            "parent_company": "string",
            "brands": "brand1 // brand2",
            "ceo": "First Middle Last // Title",
            "black_owned": "Yes or No",
            "woman_owned": "Yes or No"
            }

            Rules:
            - No commentary
            - No markdown
            - Valid JSON only
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
        body = JSON.parse(response.body)

        text = body.dig("candidates", 0, "content", "parts", 0, "text")

        JSON.parse(text || "{}")
        
      # Step 11: Handle JSON parsing errors or HTTP errors gracefully
      rescue JSON::ParserError, Net::HTTPError => e
        p "[Gemini] #{e.message}"
        'No data generated.'
      end

    end
  end
end
