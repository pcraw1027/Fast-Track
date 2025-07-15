class SocialSite < ApplicationRecord
  has_many :person_social_sites
  has_many :people, through: :person_social_sites
  default_scope -> { order(updated_at: :desc) }
  scope :grouped_people_count, -> () {
                            joins(:people).group(:id, :site).count
                          }
  scope :social_site_people_count, -> (social_site) {
                            find_by(site_code: social_site).people.count
                          }
                          
  scope :with_people_count, -> () {
                                    left_joins(:people)
                                    .select('social_sites.*, COUNT(people.id) AS people_count')
                                    .group('social_sites.id')
                                  }

end
