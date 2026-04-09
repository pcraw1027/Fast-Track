require 'net/http'
require 'uri'
require 'json'
require 'concurrent' # concurrent-ruby gem

module Domains
  module CroupierCore
    module GoogleGeminiLookup

      CONCURRENCY = 5
      MAX_RETRIES = 3
      RETRY_BASE_DELAY = 1.0 # seconds

      # Custom error class for rate limiting and transient errors
      class RateLimitError < StandardError; end

      # Generates descriptions for a batch of products concurrently
      #
      # Params:
      # - products: Array of hashes, each with :barcode and :product_name
      #   e.g. [{ barcode: '012345', product_name: 'Coca Cola' }, ...]
      #
      # Returns:
      # - Array of hashes with :barcode, :product_name, :description, :success
      def self.generate_batch_descriptions(products:)
        pool = Concurrent::FixedThreadPool.new(CONCURRENCY)

        futures = products.map do |product|
          Concurrent::Future.execute(executor: pool) do
            description = generate_with_retry(
              barcode:      product[:barcode],
              product_name: product[:product].name
            )

            {
              barcode:     product[:barcode],
              product:     product[:product],
              description: description,
              success:     description != 'No description generated.'
            }
          end
        end

        results = futures.map do |future|
          future.value(120)
        rescue => e
          Rails.logger.error("[Gemini Batch] Future failed: #{e.message}")
          nil
        end

        pool.shutdown
        pool.wait_for_termination(300)

        results.compact.tap do |r|
          succeeded = r.count { |p| p[:success] }
          failed    = r.count { |p| !p[:success] }
          Rails.logger.info("[Gemini Batch] Done — ✅ #{succeeded} succeeded, ❌ #{failed} failed")
        end
      end

      # Single product description with retry + exponential backoff
      #
      # Params:
      # - barcode: String
      # - product_name: String
      #
      # Returns:
      # - String: generated description or fallback
      def self.generate_with_retry(barcode:, product_name:)
        attempt = 0

        begin
          generate_product_description(barcode: barcode, product_name: product_name)

        rescue RateLimitError => e
          attempt += 1
          if attempt <= MAX_RETRIES
            base    = e.message.include?('503') ? 3.0 : RETRY_BASE_DELAY
            backoff = (base * (2 ** (attempt - 1))) + rand(0.1..0.5)
            Rails.logger.warn(
              "[Gemini] #{e.message} on '#{product_name}' — retry #{attempt}/#{MAX_RETRIES} in #{backoff.round(2)}s"
            )
            sleep(backoff)
            retry
          else
            Rails.logger.error("[Gemini] Max retries exceeded for '#{product_name}'")
            'No description generated.'
          end

        rescue => e
          Rails.logger.error("[Gemini] Unexpected error for '#{product_name}': #{e.message}")
          'No description generated.'
        end
      end

      # Generates a concise product description for a given barcode and product name
      #
      # Params:
      # - barcode: String, product UPC or barcode
      # - product_name: String, name of the product
      #
      # Returns:
      # - String: generated product description
      # - Raises RateLimitError if Gemini returns 429 or 503
      def self.generate_product_description(barcode:, product_name:)
        Rails.logger.info("[Gemini] #{barcode} - Generating description for '#{product_name}'")

        model    = 'gemini-2.5-flash'
        endpoint = URI(
          "https://generativelanguage.googleapis.com/v1beta/models/#{model}:generateContent"
        )
        endpoint.query = URI.encode_www_form(key: Rails.application.credentials.google_gimini_api_key)

        prompt = <<~PROMPT.strip
          Provide a single paragraph, concise, and nicely summarized Product Description similar to Google AI Mode response for barcode #{barcode} and product name #{product_name}.
        PROMPT

        payload = {
          generationConfig: { temperature: 0.0 },
          contents: [{ parts: [{ text: prompt }] }]
        }

        http              = Net::HTTP.new(endpoint.host, endpoint.port)
        http.use_ssl      = true
        http.read_timeout = 30
        http.open_timeout = 10

        request                 = Net::HTTP::Post.new(endpoint.request_uri)
        request['Content-Type'] = 'application/json'
        request.body            = JSON.generate(payload)

        response = http.request(request)

        # ✅ Raise RateLimitError for transient errors BEFORE the rescue block
        # so generate_with_retry can catch and retry them.
        raise RateLimitError, "429" if response.code == '429'
        raise RateLimitError, "503" if response.code == '503'

        unless response.is_a?(Net::HTTPSuccess)
          Rails.logger.error("[Gemini] HTTP #{response.code} for '#{product_name}'")
          return 'No description generated.'
        end

        data = JSON.parse(response.body)
        data.dig('candidates', 0, 'content', 'parts', 0, 'text') || 'No description generated.'

      rescue RateLimitError
        raise # ✅ Re-raise so generate_with_retry handles it — do NOT swallow here
      rescue JSON::ParserError, Net::HTTPError => e
        Rails.logger.error("[Gemini] #{e.message}")
        'No description generated.'
      end

    end
  end
end