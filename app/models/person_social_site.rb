class PersonSocialSite < ApplicationRecord
  belongs_to :person
  belongs_to :social_site
  validates :profile_link, presence: true
end
