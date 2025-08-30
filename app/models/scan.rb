class Scan < ApplicationRecord
  include BarcodeValidations

  belongs_to :product, optional: true
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  def self.resolve(barcode, product_id)
    where(barcode: barcode, product_exists: false).update_all(product_exists: true, product_id: product_id)
  end
  


end
