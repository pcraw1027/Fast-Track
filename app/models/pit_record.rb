class PitRecord < ApplicationRecord
  belongs_to :product, optional: true
  has_many :pit_level_users, dependent: :destroy
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
  default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
  scope :by_level, -> (pit_level) { includes(product: :company, pit_level_users: :user).where('level = ?', pit_level) }


end


