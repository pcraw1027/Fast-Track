module Domains
  module ContactAndIdentity
    class Address < ApplicationRecord
      belongs_to :address_type, class_name: "Domains::ContactAndIdentity::AddressType"
      belongs_to :country_reference, class_name: "Domains::ContactAndIdentity::CountryReference"     
      belongs_to :addressable, polymorphic: true
      validates :address1, :city, :state, :postal_code, presence: true

      enum scanned: { none_scanned: 0, scanning: 1, scanned: 2 }

      self.table_name = "addresses"

      scope :scannable, -> {
        joins(:address_type)
          .where(address_types: { scannable: true })
          .where.not(lonlat: nil)
      }

      def self.closest_to(lat:, lng:, page: 1, per_page: 5)
        return none if lat.blank? || lng.blank?

        page_num = [page.to_i, 1].max
        per_p    = [per_page.to_i, 1].max
        offset   = (page_num - 1) * per_p

        # Construct ST_Point safely with float casting
        point_sql = sanitize_sql_array([
          "ST_SetSRID(ST_MakePoint(?, ?), 4326)",
          lng.to_f,
          lat.to_f
        ])

        records = scannable
          .select(
            "addresses.*",
            # Cast both to ::geography to get accurate distance in meters
            "ST_Distance(addresses.lonlat::geography, #{point_sql}::geography) AS distance_meters"
          )
          # Use KNN operator for fast index ordering
          .order(Arel.sql("addresses.lonlat <-> #{point_sql}::geometry"))
          .limit(per_p)
          .offset(offset)

        total_count = scannable.count

        PaginatedResult.new(records, per_page, page, total_count)
      end

      before_save :set_lonlat, if: -> { lat_changed? || lng_changed? }


      private

      def set_lonlat
        return if lat.blank? || lng.blank?

        # RGeo factory for SRID 4326 (WGS84)
        factory = RGeo::Geographic.spherical_factory(srid: 4326)
        self.lonlat = factory.point(lng.to_f, lat.to_f)
      end


    end
  end
end


# ActiveRecord::Base.connection.execute(<<-SQL)
#   UPDATE addresses
#   SET lonlat = ST_SetSRID(ST_MakePoint(lng, lat), 4326)
#   WHERE lat IS NOT NULL AND lng IS NOT NULL AND lonlat IS NULL;
# SQL