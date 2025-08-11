class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :media, as: :mediaable, dependent: :destroy

  accepts_nested_attributes_for :media, allow_destroy: true
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



