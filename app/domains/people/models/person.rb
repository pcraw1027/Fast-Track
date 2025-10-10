

module Domains
  module People
    class Person < ApplicationRecord
      self.table_name = "people"
      belongs_to :gender_type, class_name: "Domains::People::GenderType", optional: true
      belongs_to :ethnicity_type, class_name: "Domains::People::EthnicityType", optional: true
      belongs_to :country_reference, class_name: "Domains::ContactAndIdentity::CountryReference", optional: true
      has_many :company_contacts, class_name: "Domains::Companies::CompanyContact", dependent: :destroy
      has_many :person_social_sites, class_name: "Domains::Socials::PersonSocialSite", dependent: :destroy
      has_many :social_sites, through: :person_social_sites, dependent: :destroy
    
      accepts_nested_attributes_for :person_social_sites, reject_if: :all_blank, allow_destroy: true
    
      mount_uploader :picture, Uploaders::PhotoUploader
      validates :first_name, :last_name, presence: true
      before_destroy :remove_photo_from_s3
      
      default_scope -> { order(updated_at: :desc) }
      
    
      private
    
    
      def remove_photo_from_s3
        if picture.present?
          picture.remove!
        end
      end
    end
        
    end
end