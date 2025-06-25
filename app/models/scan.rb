class Scan < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  validates :barcode, length: {minimum: 12, maximum: 13}, allow_blank: false
  default_scope -> { order(created_at: :desc) }

  def self.resolve(barcode, product_id)
    where(barcode: barcode, product_exists: false).update_all(product_exists: true, product_id: product_id)
  end

end
