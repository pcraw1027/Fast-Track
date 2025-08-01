class CroupierCore::UpgradeCitLevel < ApplicationService
  def call(mid:, company_id:, user_id:, level:)
    cit_rec = CitRecord.find_by(mid: mid)
    if cit_rec && cit_rec.level < level
      updates = {
            level: level
          }
          updates[:company_id] = company_id if company_id.present?
        
          cit_rec.update(updates)
    end
    CitLevelUser.find_or_create_by!(level: level, user_id: user_id, cit_record_id: cit_rec.id ) if cit_rec

  end
end
