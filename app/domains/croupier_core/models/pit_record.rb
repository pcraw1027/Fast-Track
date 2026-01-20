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

        def self.next_pit_record(level)
          pit_record = nil
          pits = Domains::CroupierCore::PitRecord.with_products

          pits.each do |pit|
            if pit.S? && level == "s"
              pit_record = pit
              break
            elsif pit.U? && level == "u"
              pit_record = pit
              break
            elsif pit.Q? && level == "q"
              pit_record = pit
              break
            elsif pit.R? && level == "r"
              pit_record = pit
              break
            elsif !pit.product&.level_1_flag && pit.product_id.blank? && level.to_i == 1
              pit_record = pit
              break
            elsif !pit.product&.level_2_flag && pit.product&.level_1_flag && level.to_i == 2
              pit_record = pit
              break
            elsif !pit.product&.level_3_flag && pit.product&.level_1_flag && level.to_i == 3
              pit_record = pit
              break
            elsif !pit.product&.level_4_flag && pit.product&.level_1_flag && level.to_i == 4
                pit_record = pit
                break
            elsif !pit.product&.level_5_flag && pit.product&.level_1_flag && level.to_i == 5
                pit_record = pit
                break
            end
          end
          pit_record
        end

      end
  end
end


# products=Domains::Products::Product.includes(:product_variants).where(name: "Unknown Product")
# products.each do |prd|
#   pvs = prd.product_variants
#   pvs.each do |pv|
#     Domains::CroupierCore::PitRecord.find_by(barcode: pv.barcode)&.destroy
#     mid = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: pv.barcode).payload
#     cit_rec = Domains::CroupierCore::CitRecord.find_by(mid: mid)

#     cit_rec.destroy if cit_rec
#     Domains::CroupierCore::BitRecord.find_by(barcode: pv.barcode)&.destroy
#     #remove upload first before scan
#     Domains::CroupierCore::UploadRecord.where(barcode: pv.barcode).delete_all
#     Domains::CroupierCore::Scan.where(barcode: pv.barcode).delete_all
#   end
#   prd.destroy
# end


# products=Domains::Products::Product.includes(:product_variants).where(size: nil, company_id: nil)
# products.each do |prd|
#   pvs = prd.product_variants
#   pvs.each do |pv|
#     pit = Domains::CroupierCore::PitRecord.find_by(barcode: pv.barcode)
#     pit.update(capture_status: 0, product_id: nil)
#   end
#   begin
#     prd.destroy
#   rescue=>e
#     p e.message
#   end
# end

# pits = Domains::CroupierCore::PitRecord.where(capture_status: 5)
# cnt=0
# pits.each do |pt|
#   pv = Domains::Products::ProductVariant.find_by(barcode: pt.barcode)
#   if pv
#     pt.update(product_id: pv.product_id)
#     cnt += 1
#     p cnt
#   end
# end