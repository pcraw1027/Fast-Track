module Domains
  module Companies
    class CompanyEthnicityStat < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company"
      belongs_to :ethnicity_type, class_name: "Domains::People::EthnicityType"
      belongs_to :employee_type, class_name: "Domains::Companies::EmployeeType"          
      self.table_name = "company_ethnicity_stats"
    end
  end
end