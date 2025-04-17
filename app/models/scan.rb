class Scan < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
  default_scope -> { order(created_at: :desc) }
end
