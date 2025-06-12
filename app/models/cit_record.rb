class CitRecord < ApplicationRecord
  belongs_to :company, optional: true
  has_many :cit_level_users
  validates :mid, uniqueness: true
  default_scope -> { order(product_activity_count: :desc) }
  scope :by_level, -> (cit_level) { where('level = ?', cit_level) }
end
