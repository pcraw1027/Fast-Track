class CroupierCore::UpgradePitLevel < ApplicationService

  def call(barcode:, product_id:, company_name:, asin:, user_id:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    if pit_rec
      pit_rec.product_activity_count = pit_rec.product_activity_count + 1
      pit_rec.product_id = product_id
      pit_rec.level = pit_rec.level + 1
      pit_rec.asin = asin if asin
      pit_rec.save!
      PitLevelUser.create!(level: pit_rec.level, user_id: user_id, pit_record_id: pit_rec.id )
    end

    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)

    if serv_req.success?
        updates = [
          "product_activity_count = product_activity_count + 1",
        ]
        params = []
      
        if company_name.present?
          updates << "company_name = ?"
          params = [company_name]
        end
      
        CitRecord.where(mid: serv_req.payload)
               .update_all([
                 updates.join(", ") + ", product_orphan_count = CASE WHEN company_id IS NULL THEN COALESCE(product_orphan_count, 0) + 1 ELSE product_orphan_count END",
                 *params
               ])
     end
     
  end

end
