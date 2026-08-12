module Domains
  module ContactAndIdentity
    class Address < ApplicationRecord
      belongs_to :address_type, class_name: "Domains::ContactAndIdentity::AddressType"
      belongs_to :country_reference, class_name: "Domains::ContactAndIdentity::CountryReference"     
      belongs_to :addressable, polymorphic: true
      validates :address1, :city, :state, :postal_code, presence: true

      enum scanned: { none_scanned: 0, scanning: 1, scanned: 2 }

      self.table_name = "addresses"

      def self.closest_to(lat:, lng:, page: 1, per_page: 5)
        offset = (page.to_i - 1) * per_page.to_i

        point_sql = sanitize_sql_array([
          "ST_SetSRID(ST_MakePoint(?, ?), 4326)::geography",
          lng,
          lat
        ])

        joins(:address_type)
          .where(address_types: { scannable: true })
          .where.not(lonlat: nil)
          .select("addresses.*, ST_Distance(addresses.lonlat, #{point_sql}) AS distance_meters")
          .order(Arel.sql("addresses.lonlat <-> #{point_sql}"))
          .limit(per_page)
          .offset(offset)
      end

    end
  end
end

