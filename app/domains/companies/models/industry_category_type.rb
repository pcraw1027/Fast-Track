module Domains
    module Companies
        class IndustryCategoryType < ApplicationRecord
            has_many :companies, class_name: "Domains::Companies::Company", dependent: :destroy
            self.table_name = "industry_category_types"
            before_validation :normalize_category_code
            validates :category_code, presence: true

            # Scope uniqueness to naics_year and linkedin_version independently
            validates :category_code, 
                        uniqueness: { scope: :naics_year, allow_nil: true }, 
                        if: -> { naics_year.present? }

            validates :category_code, 
                        uniqueness: { scope: :linkedin_version, allow_nil: true }, 
                        if: -> { linkedin_version.present? }


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