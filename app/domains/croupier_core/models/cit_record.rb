module Domains
  module CroupierCore
    class CitRecord < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company", optional: true
      has_many :cit_level_users, class_name: "Domains::CroupierCore::CitLevelUser", dependent: :destroy
      self.table_name = "cit_records"
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