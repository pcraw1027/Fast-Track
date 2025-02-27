class CompanyContact < ApplicationRecord
  belongs_to :company
  belongs_to :company_contact_type

  mount_uploader :photo, PhotoUploader
end
