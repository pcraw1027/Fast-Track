class CroupierCore::IncrPitCitProdCount < ApplicationService
  def call(barcode:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    pit_rec.increment!(:product_activity_count) if pit_rec
    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)
    cit_rec = CitRecord.find_by(mid: serv_req.payload) if serv_req.payload

    if cit_rec
      cit_rec.product_activity_count += 1
      cit_rec.product_orphan_count += 1 if cit_rec.level == 0
      cit_rec.save!
    end

  end
end
