class EmployeeType < ApplicationRecord
    has_many :company_ethnicity_stats
    has_many :company_gender_stats
end
