module Domains
    module People
        class EthnicityType < ApplicationRecord
            has_many :company_ethnicity_stats, class_name: "Domains::Companies::CompanyEthnicityStat", dependent: :destroy
            has_many :people, class_name: "Domains::People::Person", dependent: :nullify
            self.table_name = "ethnicity_types"
        end
    end
end
