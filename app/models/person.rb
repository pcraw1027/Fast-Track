class Person < ApplicationRecord
  belongs_to :gender_type
  belongs_to :ethnicity_type
  belongs_to :country_reference
  has_many :company_contacts, dependent: :destroy
  #mount_uploader :picture, PhotoUploader
  validates :first_name, :last_name, :email, presence: true
  before_destroy :remove_photo_from_s3
  
  private


  def remove_photo_from_s3
    if photo.present?
      photo.remove!
    end
  end
end
