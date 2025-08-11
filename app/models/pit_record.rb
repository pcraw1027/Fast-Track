class PitRecord < ApplicationRecord
  attr_accessor :name
  belongs_to :product, optional: true
  has_many :pit_level_users, dependent: :destroy
  default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
  scope :by_level, -> (pit_level) { includes(product: :company, pit_level_users: :user).where('level = ?', pit_level) }
  validates :barcode, presence: true, uniqueness: true
  validate :barcode_length_allowed

  private

  def barcode_length_allowed
    allowed_lengths = [6, 8, 12, 13]
    unless barcode.present? && allowed_lengths.include?(barcode.length)
      errors.add(:barcode, "must be 6, 8, 12, or 13 characters long, symbology UPC-E, EAN-8, UPC-A, or EAN-13")
    end
  end


end


