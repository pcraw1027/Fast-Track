module Domains
  module CroupierCore
      class PitRecord < ApplicationRecord
        include BarcodeValidations

        self.table_name = "pit_records"
        attr_accessor :name

        enum capture_status: { Blank: 0, S: 1, U: 2, R: 3, Q: 4, N: 5 }

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
  
        scope :for_lookup, ->(limit = 100) {
                          where.not(capture_status: capture_statuses.values_at(:S, :U, :R, :Q, :N))
                            .where(product_id: nil)
                            .limit(limit)
                        }
   

        validates :barcode, uniqueness: true

        def self.pit_interface_capture_level_1(page:, per_page:)
          left_joins(product: { product_variants: :media })
            .where(capture_status: 0)
            .where(
              "pit_records.product_id IS NULL
              OR products.name IS NULL
              OR products.name = ''
              OR products.description IS NULL
              OR products.description = ''
              OR products.company_id IS NULL
              OR media.id IS NULL"
            )
            .distinct
            .paginate(page: page, per_page: per_page)
        end


        def self.pit_interface_capture_level_2(page:, per_page:)
          joins(product: { product_variants: :media })
            .where(capture_status: 0)
            .where.not(product_id: nil)
            .where(
              "products.name IS NOT NULL AND products.name != '' AND
              products.description IS NOT NULL AND products.description != '' AND
              products.company_id IS NOT NULL"
            )
            .where(
              "products.segment_id IS NULL OR
              products.family_id IS NULL OR
              products.klass_id IS NULL OR
              products.brick_id IS NULL"
            )
            .distinct
            .paginate(page: page, per_page: per_page)
        end


        def self.pit_interface_capture_status_lookup(page:, per_page:, status:)
            includes(:pit_level_users, product: [:company, :product_variants])
            where(capture_status: status)
            .paginate(page: page, per_page: per_page)
        end

        def self.next_pit_record(level)
          pit_record = nil
          
          if level == "s"
            recs = pit_interface_capture_status_lookup(page: 1, per_page: 1, status: 1)
            pit_record = recs[0] if recs.any?
          elsif level == "u"
            recs = pit_interface_capture_status_lookup(page: 1, per_page: 1, status: 2)
            pit_record = recs[0] if recs.any?
          elsif level == "q"
            recs = pit_interface_capture_status_lookup(page: 1, per_page: 1, status: 4)
            pit_record = recs[0] if recs.any?
          elsif level == "r"
            recs = pit_interface_capture_status_lookup(page: 1, per_page: 1, status: 3)
            pit_record = recs[0] if recs.any?
          elsif level == "n"
            recs = pit_interface_capture_status_lookup(page: 1, per_page: 1, status: 5)
            pit_record = recs[0] if recs.any?
          elsif level.to_i == 1 
            recs = pit_interface_capture_level_1(page:1, per_page: 1)
            pit_record = recs[0] if recs.any?
          elsif level.to_i == 2
            recs = pit_interface_capture_level_2(page:1, per_page: 1)
            pit_record = recs[0] if recs.any?
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

#Domains::CroupierCore::PitRecord.where(capture_status: 4).update_all(capture_status: 0)