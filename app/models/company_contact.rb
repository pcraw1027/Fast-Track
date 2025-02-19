class CompanyContact < ApplicationRecord
  belongs_to :company
  belongs_to :company_contact_type
end
