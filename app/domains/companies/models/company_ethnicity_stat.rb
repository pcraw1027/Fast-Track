module Domains
  module Companies
    class CompanyEthnicityStat < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company", foreign_key: "company_id"
      belongs_to :ethnicity_type, class_name: "Domains::People::EthnicityType", foreign_key: "ethnicity_type_id"
      belongs_to :employee_type, class_name: "Domains::Companies::EmployeeType", foreign_key: "employee_type_id"          
      self.table_name = "company_ethnicity_stats"
    end

    end
end