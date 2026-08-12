module Domains
  module CroupierCore
    module BnActivityStats

      def self.compute_stats(address_id:, user_id:)

        location_scan_counts = Domains::CroupierCore::Scan
            .where(address_id: address_id)
            .count()

        start_date = 7.days.ago.beginning_of_day
        end_date   = Time.current.end_of_day

        user_bn_scan_count = Domains::CroupierCore::Scan
                                .barcode_ninja
                                .with_address
                                .where(user_id: user_id, created_at: start_date..end_date)
                                .count

        user_bn_store_count_visited = Domains::CroupierCore::Scan
                                        .barcode_ninja
                                        .with_address
                                        .where(user_id: user_id, created_at: start_date..end_date)
                                        .distinct
                                        .count(:address_id)

        total_bn_scan_count = Domains::CroupierCore::Scan
                                .barcode_ninja
                                .with_address
                                .where(created_at: start_date..end_date)
                                .count

        total_bn_store_count_visited = Domains::CroupierCore::Scan
                                        .barcode_ninja
                                        .with_address
                                        .where(created_at: start_date..end_date)
                                        .distinct
                                        .count(:address_id)

        {
          location_scan_counts: location_scan_counts,
          user_bn_scan_count: user_bn_scan_count,
          user_bn_store_count_visited: user_bn_store_count_visited,
          total_bn_scan_count: total_bn_scan_count,
          total_bn_store_count_visited: total_bn_store_count_visited
        }

      end

    
    end
  end
end
