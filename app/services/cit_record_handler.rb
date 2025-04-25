module CitRecordHandler
  def self.update_existing(cit_rec)
    cit_rec.product_activity_count += 1
    cit_rec.product_orphan_count += 1 if cit_rec.level == 0
    cit_rec.save!
    cit_rec
  end

  def self.update_or_create(cit_rec, mid:, source:, user_id:, brand:)
    if cit_rec
      self.update_existing(cit_rec)
    else
     cit_rec = CitRecord.create!(
        mid: mid,
        source: source,
        brand: brand,
        product_activity_count: 1,
        product_orphan_count: 1
      )
      CitLevelUser.create!(
        user_id: user_id,
        cit_record_id: cit_rec.id,
        level: 0
      )
      cit_rec
    end
  end

end
