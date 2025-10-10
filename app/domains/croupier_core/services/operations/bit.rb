module Domains
  module CroupierCore
    module Operations
      class Bit < ApplicationService
          def call(barcode:, source:, asin:, user_id:, brand:)
            pit_rec = Domains::CroupierCore::PitRecord.find_by(barcode: barcode)
            mid = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: barcode).payload
            cit_rec = Domains::CroupierCore::CitRecord.find_by(mid: mid)

            if pit_rec
              pit_rec.increment!(:product_activity_count)
              Domains::CroupierCore::CitRecordHandler.update_existing(cit_rec) if cit_rec
              success({:found_in_pit => true})
            else
              pit_rec = Domains::CroupierCore::PitRecord.create!(barcode: barcode, source: source, mid: mid, 
                  asin: asin, product_activity_count: 1)
              Domains::CroupierCore::PitLevelUser.create!(level: 0, user_id: user_id, pit_record_id: pit_rec.id )
              cit_rec = Domains::CroupierCore::CitRecordHandler.update_or_create(cit_rec, mid: mid, source: source, 
                              user_id: user_id, brand: brand)
              success({:found_in_pit => false})
            end
          end

        end
    end
  end
end