class CompanyEthnicityStat < ApplicationRecord
  belongs_to :company
  belongs_to :ethnicity_type
  belongs_to :employee_type
end
