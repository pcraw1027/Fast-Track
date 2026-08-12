module Domains
  module CroupierCore
    class Scan < ApplicationRecord
      include BarcodeValidations
      
      self.table_name = "scans"
      
      belongs_to :product, class_name: "Domains::Products::Product", optional: true
      belongs_to :user, class_name: "Domains::Users::User"
      default_scope -> { order(created_at: :desc) }
      enum scan_mode: { user: 0, barcode_ninja: 1}
      # Scope for non-nil address scans
      scope :with_address, -> { where.not(address_id: nil) }
      
      def self.resolve(barcode, product_id)
        where(barcode: barcode, product_exists: false).update_all(product_exists: true, product_id: product_id)
      end
      
    end
  end
end
