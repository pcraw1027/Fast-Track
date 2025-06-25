class CitRecord < ApplicationRecord
  belongs_to :company, optional: true
  has_many :cit_level_users
  validates :mid, uniqueness: true
  default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
  scope :by_level, -> (cit_level) { includes(:company, :cit_level_users).where('level = ?', cit_level) }


  def self.generate_mid(company_id)
    "C#{company_id}".ljust(8, '0')
  end
  
end
