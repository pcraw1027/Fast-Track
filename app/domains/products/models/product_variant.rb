module Domains
  module Products
    class ProductVariant < ApplicationRecord
      include BarcodeValidations

      belongs_to :product, class_name: "Domains::Products::Product"
      has_many :media, as: :mediaable, class_name: "Domains::Features::Mediable::Medium", dependent: :destroy

      accepts_nested_attributes_for :media, allow_destroy: true
      validates :barcode, uniqueness: true

      scope :by_product, ->(product_id) { includes(:media).where(product_id: product_id) }

      self.table_name = "product_variants"
      

    end
  end
end



