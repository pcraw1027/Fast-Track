class Company < ApplicationRecord
  belongs_to :industry_category_type
  mount_uploader :logo, LogoUploader
  has_many :parent_relationships, foreign_key: :parent_id, class_name: "Company_Relationship"
  has_many :parent_companies, through: :parent_relationships
  has_many :child_relationships, foreign_key: :child_id, class_name: "Company_Relationship"
  has_many :child_companies, through: :child_relationships
  has_many :company_contacts
  has_many :company_ethnicity_stats
  has_many :company_gender_stats
  has_many :products

  validates :name, presence: true
  validates :mids, uniqueness: true

  default_scope -> { order(created_at: :desc) }
  scope :find_by_mid, -> (mid) { where("mids @> ARRAY[?]::varchar[]", [mid]) }


end
