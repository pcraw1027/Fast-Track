module Domains
    module Companies
        class EmployeeType < ApplicationRecord
            has_many :company_ethnicity_stats, class_name: "Domains::Companies::CompanyEthnicityStat"
            has_many :company_gender_stats, class_name: "Domains::Companies::CompanyGenderStat"                             
            self.table_name = "employee_types"
        end
    end
end