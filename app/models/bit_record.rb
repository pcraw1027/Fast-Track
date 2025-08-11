require 'csv'

class BitRecord < ApplicationRecord
 attr_accessor :message
  belongs_to :user
  enum status: { open: 0, close: 1 }
  default_scope -> { order(updated_at: :desc) }
  validates :barcode, presence: true, uniqueness: true
  validate :barcode_length_allowed

  def invoke_bit(barcode, source, asin, user_id, brand="")
    bit_invoke_claims = CroupierCore::Bit.call!(barcode: barcode, source: source, asin: asin, 
                                                user_id: user_id, brand: brand)
    self.update(status: 1) if bit_invoke_claims.success?
  end

  def self.load_from_file(file, current_user_id)
    result = []
    CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
        barcode = row['Barcode'] || row['barcode']
        next unless barcode
        @brc_intrf_claims = CroupierCore::BarcodeInterface.call!(barcode: barcode, 
                                        source: "BIT Load", asin: nil, user_id: current_user_id)
        
        result << @brc_intrf_claims.payload if @brc_intrf_claims && @brc_intrf_claims.success?
    end
    result
  end


  private 


  def barcode_length_allowed
    allowed_lengths = [6, 8, 12, 13]
    unless barcode.present? && allowed_lengths.include?(barcode.length)
      errors.add(:barcode, "must be 6, 8, 12, or 13 characters long, symbology UPC-E, EAN-8, UPC-A, or EAN-13")
    end
  end

end
