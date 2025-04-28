class CroupierCore::UpgradeCitLevel < ApplicationService
  def call(mid:, company_id:, company_name:, user_id:)
    cit_rec = CitRecord.find_by(mid: mid)
    if cit_rec
      level = cit_rec.level + 1
      cit_rec.update(level: level, company_id: company_id, company_name: company_name) 
      CitLevelUser.create!(level: level, user_id: user_id, cit_record_id: cit_rec.id )
    end
  end
end
