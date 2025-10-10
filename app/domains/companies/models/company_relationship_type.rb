module Domains
    module Companies
        class CompanyRelationshipType < ApplicationRecord
            has_many :company_relationships, class_name: "Domains::Companies::CompanyRelationship", dependent: :destroy
            self.table_name = "company_relationship_types"
        end
    end
end