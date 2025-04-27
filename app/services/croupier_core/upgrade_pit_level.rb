class CroupierCore::UpgradePitLevel < ApplicationService
  def call(barcode:, product_id:, company_name:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    pit_rec.update(product_activity_count: pit_rec.product_activity_count + 1, 
      product_id: product_id, level: pit_rec.level + 1) if pit_rec
    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)
    cit_rec = CitRecord.find_by(mid: serv_req.payload) if serv_req.payload
    if cit_rec && cit_rec.level == 0
      cit_rec.product_activity_count = cit_rec.product_activity_count + 1
      cit_rec.product_orphan_count = cit_rec.product_orphan_count + 1,
      cit_rec.company_name = company_name if company_name
      cit_rec.save! 
    elsif cit_rec && cit_rec.level != 0
      cit_rec.update(product_activity_count: cit_rec.product_activity_count + 1) if cit_rec
    end
    
  end
end
