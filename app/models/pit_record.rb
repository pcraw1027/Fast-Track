class PitRecord < ApplicationRecord
  include BarcodeValidations

  attr_accessor :name
  belongs_to :product, optional: true
  has_many :pit_level_users, dependent: :destroy
  default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
  scope :by_level, -> (pit_level) { includes(product: :company, pit_level_users: :user).where(level: pit_level) }
  validates :barcode, uniqueness: true


end


