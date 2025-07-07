class Person < ApplicationRecord
  belongs_to :gender_type, optional: true
  belongs_to :ethnicity_type, optional: true
  belongs_to :country_reference, optional: true
  has_many :company_contacts, dependent: :destroy
  has_many :person_social_sites, dependent: :destroy
  has_many :social_sites, through: :person_social_sites, dependent: :destroy

  accepts_nested_attributes_for :person_social_sites, reject_if: :all_blank, allow_destroy: true

  mount_uploader :picture, PhotoUploader
  validates :first_name, :last_name, presence: true
  before_destroy :remove_photo_from_s3
  
  
  private


  def remove_photo_from_s3
    if picture.present?
      picture.remove!
    end
  end
end
