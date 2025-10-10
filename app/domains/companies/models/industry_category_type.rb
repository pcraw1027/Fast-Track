module Domains
    module Companies
        class IndustryCategoryType < ApplicationRecord
            has_many :companies, class_name: "Domains::Companies::Company", dependent: :destroy
            self.table_name = "industry_category_types"
        end

    end
end