module Domains
    module People
        class GenderType < ApplicationRecord
            has_many :company_gender_stats, class_name: "Domains::Companies::CompanyGenderStat", dependent: :destroy
            has_many :people, class_name: "Domains::People::Person", dependent: :nullify
            self.table_name = "gender_types"
        end
        
    end
end