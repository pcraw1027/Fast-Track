class CompanyContact < ApplicationRecord
  belongs_to :company
  belongs_to :company_contact_type
  belongs_to :person
  mount_uploader :photo, PhotoUploader
  before_destroy :remove_photo_from_s3
  accepts_nested_attributes_for :person, reject_if: :all_blank
  
  private


  def remove_photo_from_s3
    if photo.present?
      photo.remove!
    end
  end

end
