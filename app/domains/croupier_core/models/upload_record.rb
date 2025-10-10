module Domains
  module CroupierCore
    class UploadRecord < ApplicationRecord
      include BarcodeValidations

      belongs_to :scan, class_name: "Domains::CroupierCore::Scan", optional: true
      belongs_to :user, class_name: "Domains::Users::User", optional: true
      has_many :media, as: :mediaable, class_name: "Domains::Features::Mediable::Medium", dependent: :destroy
      accepts_nested_attributes_for :media, allow_destroy: true
      
      self.table_name = "upload_records"

      validates :product_name, presence: true
      validates :company_name, presence: true

      default_scope -> { order(created_at: :desc) }

      def self.user_uploads(page, per_page, user_id)
        per_page = per_page.to_i
        page = page.to_i
        offset = (page - 1) * per_page
        total_count = where(user_id: user_id).count
        uploads = includes(:scan, :media).where(user_id: user_id).limit(per_page).offset(offset)
        mapped = uploads.map do |up|
          h = {}
          h["upload"] = up
          h["scan"] = up.scan
          h["media"] = up.media
          h
        end
        PaginatedResult.new(mapped, per_page, page, total_count)
      end

      def self.resolve(barcode)
        where(barcode: barcode, resolve_status: false).update_all(resolve_status: true)
      end

    end
  end
end