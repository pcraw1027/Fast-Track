class CompanyRelationship < ApplicationRecord
  attr_accessor :new_company_name, :mids
  belongs_to :company_relationship_type
  belongs_to :parent_company, class_name: "Company"
  belongs_to :child_company, class_name: "Company"

  validate :parent_and_child_cannot_be_same

  def parent_and_child_cannot_be_same
    if parent_company_id == child_company_id
      errors.add(:child_company_id, "parent and child can't be the same!")
    end
  end

end
