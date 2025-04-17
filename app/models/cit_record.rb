class CitRecord < ApplicationRecord
  belongs_to :company, optional: true
<<<<<<< HEAD
  has_many :cit_level_users
  validates :mid, uniqueness: true
  default_scope -> { order(created_at: :desc) }
=======
  validates :mid, uniqueness: true
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
end
