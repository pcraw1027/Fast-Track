module Domains
  module CroupierCore
    module CitRecordHandler

      # Updates an existing CIT record when new activity is detected.
      #
      # Increments:
      # - product_activity_count for every activity
      # - product_orphan_count only when the CIT record is not linked to a company
      #
      # Returns the updated record.
      def self.update_existing(cit_rec)
        cit_rec.product_activity_count += 1

        # Track orphan activity when no company is associated
        cit_rec.product_orphan_count += 1 unless cit_rec.company_id

        cit_rec.save!
        cit_rec
      end

      # Updates an existing CIT record or creates a new one if none exists.
      #
      # When creating a new record:
      # - Initializes activity counters
      # - Associates metadata (mid, source, brand, company)
      # - Creates an initial CitLevelUser entry at level 0 for the user
      #
      # Returns the updated or newly created CIT record.
      def self.update_or_create(cit_rec, mid:, source:, user_id:, brand:, company_id: nil)
        if cit_rec
          # Existing CIT record → increment counters
          update_existing(cit_rec)
        else
          # No CIT record exists → create a new one
          cit_rec =
            Domains::CroupierCore::CitRecord.create!(
              mid: mid,
              source: source,
              brand: brand,
              product_activity_count: 1,
              product_orphan_count: 1,
              company_id: company_id
            )

          # Initialize user participation at level 0
          Domains::CroupierCore::CitLevelUser.create!(
            user_id: user_id,
            cit_record_id: cit_rec.id,
            level: 0
          )

          cit_rec
        end
      end
    end
  end
end
