class CroupierCore::Bit < ApplicationService
<<<<<<< HEAD
  def call(barcode:, source:, asin:, user_id:, brand:)
=======
  def call(barcode:, source:, asin:)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
    pit_rec = PitRecord.find_by(barcode: barcode)
    mid = CroupierCore::MidExtractor.call!(barcode: barcode).payload
    cit_rec = CitRecord.find_by(mid: mid)

    if pit_rec
      pit_rec.increment!(:product_activity_count)
      CitRecordHandler.update_existing(cit_rec) if cit_rec
      success({:found_in_pit => true})
    else
      PitRecord.create!(barcode: barcode, source: source, mid: mid, asin: asin, product_activity_count: 1)
<<<<<<< HEAD
      cit_rec = CitRecordHandler.update_or_create(cit_rec, mid: mid, source: source, 
                      user_id: user_id, brand: brand)
=======
      cit_rec = CitRecordHandler.update_or_create(cit_rec, mid: mid, source: source)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
      success({:found_in_pit => false})
    end
  end
end
