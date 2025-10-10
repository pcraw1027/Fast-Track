module Domains
  module Companies
    class CompanyContact < ApplicationRecord
      attr_accessor :first_name, :last_name, :middle_name
    
      belongs_to :company, class_name: "Domains::Companies::Company"
      belongs_to :company_contact_type, class_name: "Domains::Companies::CompanyContactType"
      belongs_to :person, class_name: "Domains::People::Person", optional: true
      mount_uploader :photo, Uploaders::PhotoUploader
      before_destroy :remove_photo_from_s3
    
      scope :by_company, -> (company_id) { includes(:company_contact_type, :person).where(company_id: company_id) }
      scope :company_ceo, ->(company_id) {
                            result = includes(:company_contact_type, :person)
                              .where(company_id: company_id, company_contact_types: { role: 'CEO' })
                          }
    
     self.table_name = "company_contacts"
     
      private
    
      def remove_photo_from_s3
        if photo.present?
          photo.remove!
        end
      end
    
    end
  end
end