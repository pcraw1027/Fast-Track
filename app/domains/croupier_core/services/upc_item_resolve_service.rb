module Domains
  module CroupierCore
    # Service to resolve multiple UPC records using pre-fetched product data
    class UpcItemResolveService < ApplicationService

      # Main entry point for the service
      #
      # Params:
      # - product_data_attributes: Array of hashes, each containing product data including :barcode
      # - unfound_barcodes: Array of barcodes that could not be found in the external source
      #
      # Behavior:
      # - Marks any unfound barcodes as capture_status = 5 (failed)
      # - Resolves product data for all found barcodes using LookupUtils
      def call(product_data_attributes: [], unfound_barcodes: [])

        # Step 1: Handle barcodes that were not found
        if unfound_barcodes.any?
          # Update all corresponding PitRecords to indicate failed capture
          Domains::CroupierCore::PitRecord.where(barcode: unfound_barcodes)
                                           .update_all(capture_status: 5)
        end

        # Step 2: Process product data for barcodes that were found
        if product_data_attributes.any?
          # Extract all barcodes from the product data
          barcodes = product_data_attributes.map { |pd| pd[:barcode] }

          # Fetch all PitRecords matching these barcodes
          pit_recs = Domains::CroupierCore::PitRecord.where(barcode: barcodes)

          # Build a hash for quick lookup by barcode
          # - Key: barcode
          # - Value: array of PitRecords with that barcode
          pit_hash = pit_recs.group_by(&:barcode)

          # Step 3: Iterate through each product data and resolve the corresponding PitRecord
          product_data_attributes.each do |product_data|
            Domains::CroupierCore::LookupUtils.resolve_records(
              pit: pit_hash[product_data[:barcode]]&.first,  # Take first PitRecord if multiple exist
              product_data: product_data,                     # Provide pre-fetched product data
              to_resolve: true                                # Flag to indicate resolution is from provided data
            )
          end
        end

      end

    end
  end
end
