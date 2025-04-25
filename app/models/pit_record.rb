class PitRecord < ApplicationRecord
  belongs_to :product, optional: true
  has_many :pit_level_users
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false, uniqueness: true
  default_scope -> { order(created_at: :desc) }
  scope :by_level, -> (pit_level) { where('level = ?', pit_level) }
end
