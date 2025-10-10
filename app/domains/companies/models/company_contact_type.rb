module Domains
    module Companies
      class CompanyContactType < ApplicationRecord
         has_many :company_contacts, class_name: "Domains::Companies::CompanyContact", dependent: :destroy
         self.table_name = "company_contact_types"
      end
    end
end
