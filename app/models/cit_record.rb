class CitRecord < ApplicationRecord
  belongs_to :company, optional: true
  has_many :cit_level_users
  validates :mid, uniqueness: true
  default_scope -> { order(created_at: :desc) }
end
