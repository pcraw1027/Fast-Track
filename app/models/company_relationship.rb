class CompanyRelationship < ApplicationRecord
  belongs_to :company_relationship_type
  belongs_to :parent_company, class_name: "Company"
  belongs_to :child_company, class_name: "Company"

  def company_name()
    @company_name = Company.find().name 
  end
end
=begin
belongs_to :company_relationship_type
belongs_to :parent_company, class_name: ’Company’
belongs_to :child_company, class_name: 'Company’
=end