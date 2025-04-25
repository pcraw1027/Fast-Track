class Company < ApplicationRecord
  attr_accessor :mid, :photo, :email, :phone, :contact_name
  belongs_to :industry_category_type
  mount_uploader :logo, LogoUploader
  has_many :parent_relationships, foreign_key: :parent_company_id, class_name: "CompanyRelationship"
  has_many :parent_companies, through: :parent_relationships
  has_many :child_relationships, foreign_key: :parent_company_id, class_name: "CompanyRelationship"
  has_many :child_companies, through: :child_relationships
  has_many :company_contacts, dependent: :destroy
  has_many :company_ethnicity_stats, dependent: :destroy
  has_many :company_gender_stats, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :cit_records, dependent: :destroy

  validates :name, presence: true
  validates :mids, uniqueness: true

  default_scope -> { order(created_at: :desc) }
  scope :find_by_mid, -> (mid) { where("mids @> ARRAY[?]::varchar[]", [mid]) }


end
