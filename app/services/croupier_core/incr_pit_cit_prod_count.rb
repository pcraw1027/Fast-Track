class CroupierCore::IncrPitCitProdCount < ApplicationService
  def call(barcode:)
    PitRecord.where(barcode: barcode).update_all("product_activity_count = product_activity_count + 1")

    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)
    if serv_req.success?
      CitRecord.where(mid: serv_req.payload)
               .update_all("product_activity_count = product_activity_count + 1, product_orphan_count = product_orphan_count + CASE WHEN level = 0 THEN 1 ELSE 0 END")
    end
    
  end
end
