class BitRecord < ApplicationRecord
<<<<<<< HEAD
 
  belongs_to :user
  enum status: { open: 0, close: 1 }
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false
  default_scope -> { order(created_at: :desc) }

  def invoke_bit(barcode, source, asin, user_id, brand="")
    bit_invoke_claims = CroupierCore::Bit.call!(barcode: barcode, source: source, asin: asin, 
                                                user_id: user_id, brand: brand)
=======
  after_create :invoke_bit
  enum status: { open: 0, close: 1 }
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false

  private 

  def invoke_bit
    bit_invoke_claims = CroupierCore::Bit.call!(barcode: self.barcode, source: self.source, asin: self.asin)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
    self.update(status: 1) if bit_invoke_claims.success?
  end


end
