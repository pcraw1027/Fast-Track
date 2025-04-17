class CroupierCore::IncrPitCitProdCount < ApplicationService
  def call(barcode:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    pit_rec.update(product_activity_count: pit_rec.product_activity_count + 1) if pit_rec
    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)
    cit_rec = CitRecord.find_by(mid: serv_req.payload) if serv_req.payload
    cit_rec.update(product_activity_count: cit_rec.product_activity_count + 1) if cit_rec

  end
end
