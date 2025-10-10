module Domains
  module CroupierCore
    module Operations
      class MidExtractor < ApplicationService
        
        STRATEGIES = {
          6 => ->(barcode) { barcode[0..6] },
          8 => ->(barcode) { barcode[1..6] },
          12 => ->(barcode) { barcode[1..5] },
          13 => ->(barcode) { barcode[2..6] }
        }.freeze
      
        def call(barcode:)
          extractor = STRATEGIES[barcode.length]
      
          if extractor
            success extractor.call(barcode)
          else
            failure "Unsupported barcode format"
          end
        end
      end
     
    end
  end
end