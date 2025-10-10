module Domains
  module CroupierCore
    module Operations
      class IncrPitCitProdCount < ApplicationService
        def call(barcode:)
          
          Domains::CroupierCore::PitRecord.find_by(barcode: barcode)&.increment!(:product_activity_count)
      
          serv_req = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: barcode)
          if serv_req.success?
            record = Domains::CroupierCore::CitRecord.find_by(mid: serv_req.payload)
            record&.update(
              product_activity_count: record.product_activity_count + 1,
              product_orphan_count: record.product_orphan_count + (record.level == 0 ? 1 : 0)
            )
          end
          
        end
      end
 
    end
  end
end