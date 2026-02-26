require 'net/http'

module Domains
  module CroupierCore
    # Service class to perform UPC Item DB lookups for CitRecords
    # Processes a batch of CitRecords and resolves product data using googe gimini
    class CitLevel1Service < ApplicationService

      # Main entry point for the service
      #
      # Params:
      # - count: Integer, number of CitRecords to fetch for lookup
      #
      # Behavior:
      # - Fetches `count` number of CitRecords that are ready for lookup
      # - Iterates through each record and resolves product data
      # - Handles rate limiting and logs errors
      def call(count:)
        # Step 1: Fetch CitRecords ready for UPC lookup
        #cit_recs = Domains::CroupierCore::CitRecord.cit_interface_capture_level_1(page: 1, per_page: count)
        level2_products = Domains::Products::Product.products_cit_capture_level_1(page: 1, per_page: count)
        # Step 2: Iterate over each citRecord
        level2_products.each_with_index do |product, index|

          p "%%%%%%%%%%%%%%%%%%%%%%"
          p product.name
          p product.brick.title
          p "%%%%%%%%%%%%%%%%%%%%%%"

          cit_recs = product.company.cit_records

          cit_recs.each do |cit|
                begin
                # Attempt to resolve product data for the currenproductRecord

                Domains::CroupierCore::CitLookupUtils.resolve_records(cit: cit, company: product.company, brick: product.brick)

                # Step 3: Handle API rate limiting from UPC Item DB
                rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
                  Rails.logger.warn "UPCitemDB rate limited. Waiting before retry..."
                  
                  sleep 30   # wait 30 seconds before retrying
                  retry      # retry the same citRecord after wait

                # Step 4: Catch all other errors for logging
                rescue StandardError => e
                  Rails.logger.error "Lookup failed for citRecord #{cit.id}: #{e.message}"
                end
          end

          

          # Step 5: Introduce delay between requests to avoid hitting rate limits
          # Skip delay after the last record
          unless index == level2_products.size - 1
            sleep 15   # roughly 4 requests per minute
          end

        end


      end         

    end
  end
end
