class CroupierCore::Bit < ApplicationService
  def call(barcode:, source:, asin:, user_id:, brand:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    mid = CroupierCore::MidExtractor.call!(barcode: barcode).payload
    cit_rec = CitRecord.find_by(mid: mid)

    if pit_rec
      pit_rec.increment!(:product_activity_count)
      CitRecordHandler.update_existing(cit_rec) if cit_rec
      success({:found_in_pit => true})
    else
      PitRecord.create!(barcode: barcode, source: source, mid: mid, asin: asin, product_activity_count: 1)
      cit_rec = CitRecordHandler.update_or_create(cit_rec, mid: mid, source: source, 
                      user_id: user_id, brand: brand)
      success({:found_in_pit => false})
    end
  end
end

