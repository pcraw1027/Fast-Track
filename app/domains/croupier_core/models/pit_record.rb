module Domains
  module CroupierCore
      class PitRecord < ApplicationRecord
        include BarcodeValidations

        self.table_name = "pit_records"
        attr_accessor :name

        enum capture_status: { Blank: 0, S: 1, U: 2, R: 3, Q: 4, N: 5}

        CAPTURE_STATUS = {
          "Blank"   => 0,
          "S"      => 1,
          "U"      => 2,
          "R"      => 3,
          "Q"      => 4,
          "N"      => 5
        }
      
        belongs_to :product, class_name: "Domains::Products::Product", optional: true
        has_many :pit_level_users, class_name: "Domains::CroupierCore::PitLevelUser", dependent: :destroy
        default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
        scope :by_level, ->(pit_level) { includes(product: :company, pit_level_users: :user).where(level: pit_level) }
        scope :with_products, -> { includes(:product, :pit_level_users) }
        scope :for_lookup, ->(limit = 100) {
                          where.not(capture_status: capture_statuses.values_at(:S, :U, :R, :Q, :N))
                            .where(product_id: nil)
                            .limit(limit)
                        }
   

        validates :barcode, uniqueness: true

      end
  end
end


# products=Domains::Products::Product.includes(:product_variants).where(name: "Unknown Product")
# products.each do |prd|
#   pvs = prd.product_variants
#   pvs.each do |pv|
#     Domains::CroupierCore::PitRecord.find_by(barcode: pv.barcode).destroy
#     mid = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: pv.barcode).payload
#     cit_rec = Domains::CroupierCore::CitRecord.find_by(mid: mid)

#     cit_rec.destroy if cit_rec
#     Domains::CroupierCore::BitRecord.find_by(barcode: pv.barcode).destroy
#     Domains::CroupierCore::Scan.where(barcode: pv.barcode).delete_all
#     Domains::CroupierCore::UploadRecord.where(barcode: pv.barcode).delete_all
#   end
# end
