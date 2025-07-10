class CompanyContact < ApplicationRecord
  attr_accessor :first_name, :last_name, :middle_name

  belongs_to :company
  belongs_to :company_contact_type
  belongs_to :person
  mount_uploader :photo, PhotoUploader
  before_destroy :remove_photo_from_s3

  scope :by_company, -> (company_id) { includes(:company_contact_type, :person).where(company_id: company_id) }
  scope :company_ceo, ->(company_id) {
                        result = includes(:company_contact_type, :person)
                          .where(company_id: company_id, company_contact_types: { role: 'CEO' })
                      }



  private



  def remove_photo_from_s3
    if photo.present?
      photo.remove!
    end
  end

end
