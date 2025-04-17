class BitRecord < ApplicationRecord
 
  belongs_to :user
  enum status: { open: 0, close: 1 }
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false
  default_scope -> { order(created_at: :desc) }

  def invoke_bit(barcode, source, asin, user_id, brand="")
    bit_invoke_claims = CroupierCore::Bit.call!(barcode: barcode, source: source, asin: asin, 
                                                user_id: user_id, brand: brand)
    self.update(status: 1) if bit_invoke_claims.success?
  end


end
