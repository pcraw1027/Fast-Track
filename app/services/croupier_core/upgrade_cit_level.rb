class CroupierCore::UpgradeCitLevel < ApplicationService
  def call(mid:, company_id:, company_name:)
    cit_rec = CitRecord.find_by(mid: mid)
    cit_rec.update(level: cit_rec.level + 1, company_id: company_id, company_name: company_name) if cit_rec
  end
end
