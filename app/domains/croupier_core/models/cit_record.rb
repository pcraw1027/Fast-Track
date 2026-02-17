module Domains
  module CroupierCore
    class CitRecord < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company", optional: true
      has_many :cit_level_users, class_name: "Domains::CroupierCore::CitLevelUser", dependent: :destroy
      self.table_name = "cit_records"
      
      enum capture_status: { Blank: 0, S: 1, U: 2, R: 3, Q: 4, N: 5 }

      FILTER_SCOPE_MAP = {
        "parent"     => :for_parent_companies,
        "subsidiary" => :for_child_only_companies,
        "all"        => :with_company_and_level_users
      }.freeze

      CAPTURE_STATUS = {
          "Blank"   => 0,
          "S"      => 1,
          "U"      => 2,
          "R"      => 3,
          "Q"      => 4,
          "N"      => 5
        }
      #scopes
      default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
      scope :by_level, ->(cit_level) { includes(:company, :cit_level_users).where(level: cit_level) }
      scope :with_company_and_level_users, -> { includes(:company, :cit_level_users) }

      scope :for_parent_companies, lambda {
        joins(company: :child_relationships)
          .includes(:company, :cit_level_users)
          .distinct
      }

      scope :for_child_only_companies, lambda {
        joins(:company)
          .left_outer_joins(company: :child_relationships) # Check they’re not parents
          .joins(company: :parent_relationships)            # But they are children
          .where(child_relationships: { id: nil }) # i.e., no child_relationships
          .includes(:company, :cit_level_users)
          .distinct
      }

      scope :for_companies_with_products, lambda {
            joins(company: :products)
              .includes(:company)
              .distinct
      }

      scope :level_1, lambda {
          joins(:company)
            .where(capture_status: 0)
            .where.not(company_id: nil)
            .where("companies.name IS NOT NULL AND companies.name != ''")
            .where(
              "companies.industry_category_type_id IS NULL OR
              companies.logo IS NULL OR
              companies.website IS NULL OR
              companies.established IS NULL OR
              companies.black_owned IS NULL OR
              companies.female_owned IS NULL"
            )
            .distinct
        }

      scope :level_2, lambda {
              joins(company: :addresses)
              .includes(:company)
              .distinct
            }

      scope :level_3, lambda {
              joins(:company)
                .where(<<~SQL)
                  EXISTS (
                    SELECT 1
                    FROM parent_relationships
                    WHERE parent_relationships.company_id = companies.id
                  )
                  OR EXISTS (
                    SELECT 1
                    FROM child_relationships
                    WHERE child_relationships.company_id = companies.id
                  )
                SQL
            }

      scope :level_4, lambda {
              joins(:company)
                .where(<<~SQL)
                  EXISTS (
                    SELECT 1
                    FROM company_contacts
                    WHERE company_contacts.company_id = companies.id
                      AND company_contacts.person_id IS NOT NULL
                  )
                SQL
            }


     scope :level_5, lambda {
            joins(:company)
              .where(<<~SQL)
                EXISTS (
                  SELECT 1
                  FROM company_snapshots
                  WHERE company_snapshots.company_id = companies.id
                    AND (
                      company_snapshots.employee_demographics_transparency != 'none'
                      OR company_snapshots.employee_demographics_performance != 'none'
                      OR company_snapshots.projected_culture_and_identity != 'none'
                      OR company_snapshots.mgmt_composition_transparency != 'none'
                      OR company_snapshots.mgmt_composition_performance != 'none'
                    )
                )
              SQL
          }


      # helper class methods
      def self.cit_interface_capture_level_1(page:, per_page:)
            joins(:company)
            .where(capture_status: 0)
            .where.not(company_id: nil)
            .where(
              "companies.name IS NOT NULL AND companies.name != ''"
            )
            .where(
              "companies.industry_category_type_id IS NULL OR
               companies.logo IS NULL OR
               companies.website IS NULL OR
               companies.established IS NULL OR
               companies.black_owned IS NULL OR
               companies.female_owned IS NULL"
            )
            .distinct
            .paginate(page: page, per_page: per_page)
      end

      def self.cit_interface_capture_status_lookup(page:, per_page:, status:)
            includes(:company)
            where(capture_status: status)
            .paginate(page: page, per_page: per_page)
        end

        def self.next_cit_record(level:, filter_by: nil)
          cit_record = nil
          
          if level == "s"
            recs = cit_interface_capture_status_lookup(page: 1, per_page: 1, status: 1)
            cit_record = recs[0] if recs.any?
          elsif level == "u"
            recs = cit_interface_capture_status_lookup(page: 1, per_page: 1, status: 2)
            cit_record = recs[0] if recs.any?
          elsif level == "q"
            recs = cit_interface_capture_status_lookup(page: 1, per_page: 1, status: 4)
            cit_record = recs[0] if recs.any?
          elsif level == "r"
            recs = cit_interface_capture_status_lookup(page: 1, per_page: 1, status: 3)
            cit_record = recs[0] if recs.any?
          elsif level == "n"
            recs = cit_interface_capture_status_lookup(page: 1, per_page: 1, status: 5)
            cit_record = recs[0] if recs.any?
          elsif level.to_i == 1 
            recs = apply_level_filter(level: 1, page: 1, per_page: 1, filter_by: filter_by)
            cit_record = recs[0] if recs.any?
          elsif level.to_i == 2
            recs = apply_level_filter(level: 2, page: 1, per_page: 1, filter_by: filter_by)
            cit_record = recs[0] if recs.any?
          elsif level.to_i == 3
            recs = apply_level_filter(level: 3, page: 1, per_page: 1, filter_by: filter_by)
            cit_record = recs[0] if recs.any?
          elsif level.to_i == 4
            recs = apply_level_filter(level: 4, page: 1, per_page: 1, filter_by: filter_by)
            cit_record = recs[0] if recs.any?
          elsif level.to_i == 5
            recs = apply_level_filter(level: 5, page: 1, per_page: 1, filter_by: filter_by)
            cit_record = recs[0] if recs.any?
          end

          cit_record

        end


      def self.apply_level_filter(level:, page:, per_page:, filter_by:)
        scope_method = FILTER_SCOPE_MAP[filter_by] || :for_companies_with_products
        Domains::CroupierCore::CitRecord
          .public_send(scope_method)
          .public_send("level_#{level}")
          .paginate(page: page, per_page: per_page)
      end

      def self.generate_mid(company_id)
        base_mid = "C#{company_id}".ljust(8, '0')
        mid = base_mid
        suffix = 1
        while Domains::CroupierCore::CitRecord.exists?(mid: mid)
          mid = "#{base_mid}#{suffix}"
          suffix += 1
        end
        mid
      end  

      def self.system_generated?(mid)
        mid.include?('C')
      end

      def self.normalize_cit_rec(cit_rec, company_id)
          return unless cit_rec.company_id != company_id

              cit_rec.update(company_id: company_id) 
              cit_recs = Domains::CroupierCore::CitRecord.where(company_id: company_id)

              return unless cit_recs.any?

                cit_recs.each do |cit|
                    next unless Domains::CroupierCore::CitRecord.system_generated?(cit.mid)

                    cit.destroy
                    break
                end
          
      end

      def self.resolve_cit_rec(mid, company_id, user_id)
        cit_recs = Domains::CroupierCore::CitRecord.where(company_id: company_id)
        mid_updated = false
        if cit_recs.any?
          cit_recs.each do |cit_rec|
              next unless Domains::CroupierCore::CitRecord.system_generated?(cit_rec.mid)

              cit_rec.update(mid: mid, company_id: company_id)
              mid_updated = true
              break
          end
        end

          return if mid_updated

            Domains::CroupierCore::CitRecordHandler
              .update_or_create(nil, mid: mid, source: "Product Import",
              user_id: user_id, company_id: company_id, brand: nil)
          
      end


    end
  end
end