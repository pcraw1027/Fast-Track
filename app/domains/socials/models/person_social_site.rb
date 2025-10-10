module Domains
  module Socials
    class PersonSocialSite < ApplicationRecord
      belongs_to :person, class_name: "Domains::People::Person"
      belongs_to :social_site, class_name: "Domains::Socials::SocialSite"
    
      validates :profile_link, presence: true
    
      self.table_name = "person_social_sites"
    
    end
  end
end
