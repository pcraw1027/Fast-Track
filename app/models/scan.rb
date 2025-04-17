class Scan < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
<<<<<<< HEAD
  default_scope -> { order(created_at: :desc) }
=======
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
end
