module Domains
    module Companies
        class IndustryCategoryTypeMapping < ApplicationRecord
            self.table_name = "industry_category_type_mappings"
            belongs_to :category_code_type_from, class_name: "Domains::Companies::IndustryCategoryType"
            belongs_to :category_code_type_to, class_name: "Domains::Companies::IndustryCategoryType"
            enum mapping_type: { naics_2022_to_2017: 0, naics_2017_to_v2: 1 }

        end
    end
end

