class Scan < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  validates :barcode, presence: true, uniqueness: true
  validate :barcode_length_allowed
  
  default_scope -> { order(created_at: :desc) }

  def self.resolve(barcode, product_id)
    where(barcode: barcode, product_exists: false).update_all(product_exists: true, product_id: product_id)
  end


  private


  def barcode_length_allowed
    allowed_lengths = [6, 8, 12, 13]
    unless barcode.present? && allowed_lengths.include?(barcode.length)
      errors.add(:barcode, "must be 6, 8, 12, or 13 characters long, symbology UPC-E, EAN-8, UPC-A, or EAN-13")
    end
  end

end
