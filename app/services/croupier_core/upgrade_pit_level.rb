class CroupierCore::UpgradePitLevel < ApplicationService

  def call(barcode:, product_id:, company_name:, asin:, user_id:, company_id:, level:)
    pit_rec = PitRecord.find_by(barcode: barcode)
    if pit_rec && pit_rec.level < level
      pit_rec.product_activity_count = pit_rec.product_activity_count + 1
      pit_rec.product_id = product_id
      pit_rec.level = level
      pit_rec.asin = asin if asin
      pit_rec.save!
    end
    
    PitLevelUser.find_or_create_by!(level: level, user_id: user_id, pit_record_id: pit_rec.id ) if pit_rec
    serv_req = CroupierCore::MidExtractor.call!(barcode: barcode)

    if serv_req.success?
        record = CitRecord.find_by(mid: serv_req.payload)
        if record
          updates = {
            product_activity_count: record.product_activity_count + 1,
            product_orphan_count: record.product_orphan_count + (record.company_id.nil? ? 1 : 0)
          }

          updates[:company_name] = company_name if company_name.present?
          updates[:company_id] = company_id if company_id.present?
        
          record.update(updates)
        end
     end
     
  end

end
