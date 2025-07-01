class CroupierCore::UpgradeCitLevel < ApplicationService
  def call(mid:, company_id:, company_name:, user_id:, level:)
    cit_rec = CitRecord.find_by(mid: mid)
    if cit_rec && cit_rec.level < level
      cit_rec.update(level: level, company_id: company_id, company_name: company_name) 
    end
    CitLevelUser.find_or_create_by!(level: level, user_id: user_id, cit_record_id: cit_rec.id ) if cit_rec

  end
end
