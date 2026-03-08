module Domains
    module Companies
        class IndustryCategoryType < ApplicationRecord
            has_many :companies, class_name: "Domains::Companies::Company", dependent: :destroy
            self.table_name = "industry_category_types"
            before_validation :normalize_category_code

            private

            def normalize_category_code
            self.category_code = category_code&.to_s&.gsub(/\s+/, "")
            end

        end
    end
end

# Domains::Companies::IndustryCategoryType.all.each do |record|
#   cleaned = record.category_code&.to_s&.gsub(/\s+/, "")
#   record.update_column(:category_code, cleaned)
# end