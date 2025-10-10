module Domains
  module Companies
      class CompanyGenderStat < ApplicationRecord
        belongs_to :company, class_name: "Domains::Companies::Company", foreign_key: "company_id"
        belongs_to :gender_type, class_name: "Domains::People::GenderType", foreign_key: "gender_type_id"
        belongs_to :employee_type, class_name: "Domains::Companies::EmployeeType", foreign_key: "employee_type_id"
      
        self.table_name = "company_gender_stats"
      end

    end
end