class CompanyContact < ApplicationRecord
  belongs_to :company
  belongs_to :company_contact_type

  mount_uploader :photo, PhotoUploader

  before_destroy :remove_photo_from_s3

  
  private


  def remove_photo_from_s3
    if photo.present?
      photo.remove!
      photo.clear!
      photo.recreate_versions! 
    end
  end
end
