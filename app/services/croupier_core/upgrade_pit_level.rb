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
        record = CitRecord.find_by(mid: serv_req.payload)
        if record
          updates = {
            product_activity_count: record.product_activity_count + 1,
            product_orphan_count: record.product_orphan_count + (record.company_id.nil? ? 1 : 0)
          }

          updates[:company_name] = company_name if company_name.present?

          record.update(updates)
        end
     end
     
  end

end
