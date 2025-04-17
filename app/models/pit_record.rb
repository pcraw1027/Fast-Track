class PitRecord < ApplicationRecord
  belongs_to :product, optional: true
<<<<<<< HEAD
  has_many :pit_level_users
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
  default_scope -> { order(created_at: :desc) }
=======
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
 
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
end
