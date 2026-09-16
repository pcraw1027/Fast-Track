
module Domains
  module Companies
    class NormalizeDisplay < ApplicationService

      def call
        companies = Companies::Company.where.not(industry_category_type_id: nil)
        companies.each do |company|
          mapped_sector = mapped_industry_sector(company)
          company.update_column(:sector, mapped_sector)
        end
      end

      def mapped_industry_sector(company)
        from_id = company.industry_category_type_id
        return "" if from_id.blank?

        from_category = Domains::Companies::IndustryCategoryType.find_by(id: from_id)
        return "" unless from_category

        raw_year = from_category.naics_year

        mapping_type =
            case raw_year.to_i
            when 2017 then :naics_2017_to_v2
            when 2022 then :naics_2022_to_2017
            else
            return ""
            end

        target_id =
            if mapping_type == :naics_2017_to_v2
                scope = Domains::Companies::IndustryCategoryTypeMapping
                            .where(category_code_type_from_id: from_id, mapping_type: :naics_2017_to_v2)

                scope.order(:id).pick(:category_code_type_to_id)
            else
                prev_scope = Domains::Companies::IndustryCategoryTypeMapping
                                .where(category_code_type_from_id: from_id, mapping_type: :naics_2022_to_2017)

                prev_ids = prev_scope.distinct.pluck(:category_code_type_to_id)

                return "" if prev_ids.empty?

                final_scope = Domains::Companies::IndustryCategoryTypeMapping
                                .where(category_code_type_from_id: prev_ids, mapping_type: :naics_2017_to_v2)

                final_scope.order(:id).pick(:category_code_type_to_id)
            end

        return "" if target_id.blank?

        target_category = Domains::Companies::IndustryCategoryType.find_by(id: target_id)

        target_category&.title&.to_s.to_s
     end

    end
  end
end
