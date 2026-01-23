require 'net/http'
require 'uri'
require 'json'

module Domains
  module CroupierCore
      module GoogleGeminiLookup

        def self.generate_product_description(barcode:, product_name:)
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
                p "GIMI DATA: #{data.inspect}"
                data.dig('candidates', 0, 'content', 'parts', 0, 'text') ||
                    'No description generated.'
                rescue JSON::ParserError, Net::HTTPError => e
                    p "[Gemini] #{e.message}"
                    'No description generated.'
            end


      end
  end
end
