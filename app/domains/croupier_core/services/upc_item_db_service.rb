require 'net/http'

module Domains
  module CroupierCore
    # Service class to perform UPC Item DB lookups for PitRecords
    # Processes a batch of PitRecords and resolves product data using external API
    class UpcItemDbService < ApplicationService

      # Main entry point for the service
      #
      # Params:
      # - count: Integer, number of PitRecords to fetch for lookup
      #
      # Behavior:
      # - Fetches `count` number of PitRecords that are ready for lookup
      # - Iterates through each record and resolves product data
      # - Handles rate limiting and logs errors
      def call(count:)
        # Step 1: Fetch PitRecords ready for UPC lookup
        pit_recs = Domains::CroupierCore::PitRecord.for_lookup(count)

        # Step 2: Iterate over each PitRecord
        pit_recs.each_with_index do |pit, index|
          begin
            # Attempt to resolve product data for the current PitRecord
            Domains::CroupierCore::LookupUtils.resolve_records(pit: pit)

          # Step 3: Handle API rate limiting from UPC Item DB
          rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
            Rails.logger.warn "UPCitemDB rate limited. Waiting before retry..."
            
            sleep 30   # wait 30 seconds before retrying
            retry      # retry the same PitRecord after wait

          # Step 4: Catch all other errors for logging
          rescue StandardError => e
            Rails.logger.error "Lookup failed for PitRecord #{pit.id}: #{e.message}"
          end

          # Step 5: Introduce delay between requests to avoid hitting rate limits
          # Skip delay after the last record
          unless index == pit_recs.size - 1
            sleep 15   # roughly 4 requests per minute
          end
        end
      end         

    end
  end
end
