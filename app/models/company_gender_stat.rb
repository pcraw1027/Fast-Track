class CompanyGenderStat < ApplicationRecord
  belongs_to :company
  belongs_to :gender_type
  belongs_to :employee_type
end
