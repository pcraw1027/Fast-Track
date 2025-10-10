module Domains
  module CroupierCore
    module Operations
        class BarcodeInterface < ApplicationService

            SUPPORTED_SYMBOLOGIES = {
              "upc_a" => "UPC-A",
              "upc_e" => "UPC-E",
              "ean8" => "EAN-8", 
              "ean13" => "EAN-13"
            }.freeze

            SUPPORTED_SYMBOLOGIES_BY_BARCODE_LENGTH = {
              6 => "UPC-E",
              8 => "EAN-8", 
              12 => "UPC-A",
              13 => "EAN-13"
            }.freeze

          def call(barcode:, source:, asin:, user_id:, symbology: nil)
            bit_rec = Domains::CroupierCore::BitRecord.find_by(barcode: barcode, source: source)
            if bit_rec
              Domains::CroupierCore::Operations::IncrPitCitProdCount.call!(barcode: barcode)
              success({:bit_rec => bit_rec, :message => "Barcode Exists"})
            else
              barcode_symbology = SUPPORTED_SYMBOLOGIES[symbology] || "Unknown"

              if barcode_symbology == "Unknown"
                barcode_symbology = SUPPORTED_SYMBOLOGIES_BY_BARCODE_LENGTH[barcode.length] || "Unknown"
              end
              bit_rec = Domains::CroupierCore::BitRecord.create!(barcode: barcode, status: 0, source: source,
                      asin: asin, user_id: user_id, symbology: barcode_symbology)
              bit_rec.invoke_bit(barcode, source, asin, user_id)
              success({:bit_rec => bit_rec, :message => "Barcode Added"})
            end
          end
          
        end
      end
    end
  end

