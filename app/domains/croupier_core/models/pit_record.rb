module Domains
  module CroupierCore
      class PitRecord < ApplicationRecord
        include BarcodeValidations

        self.table_name = "pit_records"
        attr_accessor :name

        enum capture_status: { Blank: 0, S: 1, U: 2, R: 3 }

        CAPTURE_STATUS = {
          "Blank"   => 0,
          "S"  => 1,
          "U"      => 2,
          "R"      => 3
        }
      
        belongs_to :product, class_name: "Domains::Products::Product", optional: true
        has_many :pit_level_users, class_name: "Domains::CroupierCore::PitLevelUser", dependent: :destroy
        default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
        scope :by_level, ->(pit_level) { includes(product: :company, pit_level_users: :user).where(level: pit_level) }
        scope :with_products, -> { includes(:product, :pit_level_users) }
    

        validates :barcode, uniqueness: true

      end
  end
end


