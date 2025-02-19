class Company < ApplicationRecord
  belongs_to :industry_category_type
  mount_uploader :logo, LogoUploader
  has_many :parent_company_company_relationships, class_name: ‘Company_Relationship’, foreign_key: ‘parent_company_id’
  has_many :child_company_company_relationships, class_name: ‘Company_Relationship’, foreign_key: ‘child_company_id’
  has_many :company_contacts
  has_many :company_ethnicity_stats
  has_many :company_gender_stats
  has_many :products

  validates :name, industry_category_type_id, presence: true
  validates :name, uniqueness: true
end
