module Domains
  module Companies
      class CompanyGenderStat < ApplicationRecord
        belongs_to :company, class_name: "Domains::Companies::Company"
        belongs_to :gender_type, class_name: "Domains::People::GenderType"
        belongs_to :employee_type, class_name: "Domains::Companies::EmployeeType"
      
        self.table_name = "company_gender_stats"
      end
  end
end