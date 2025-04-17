class UploadRecord < ApplicationRecord
  belongs_to :scan
  belongs_to :user
  validates :product_name, presence: true
  validates :company_name, presence: true
  default_scope -> { order(created_at: :desc) }
end
