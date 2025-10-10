module BarcodeValidations
  extend ActiveSupport::Concern

  included do
    validates :barcode, presence: true
    validate :barcode_length_allowed
  end

  private

  def barcode_length_allowed
    allowed_lengths = [6, 8, 12, 13]
    unless barcode.present? && allowed_lengths.include?(barcode.length)
      errors.add(
        :barcode,
        "must be 6, 8, 12, or 13 characters long, symbology UPC-E, EAN-8, UPC-A, or EAN-13"
      )
    end
  end
  
end
