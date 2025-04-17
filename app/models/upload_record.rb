class UploadRecord < ApplicationRecord
  belongs_to :scan
  belongs_to :user
  validates :product_name, presence: true
  validates :company_name, presence: true
<<<<<<< HEAD
  default_scope -> { order(created_at: :desc) }
=======
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
end
