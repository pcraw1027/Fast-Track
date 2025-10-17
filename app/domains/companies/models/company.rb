module Domains
  module Companies
      class Company < ApplicationRecord
        include Searchable

        attr_accessor :mid, :photo, :email, :phone, :contact_name, :new_company_name, :company_id

        belongs_to :industry_category_type, optional: true
        mount_uploader :logo, Uploaders::LogoUploader
        has_many :parent_relationships, foreign_key: :child_company_id, class_name: "Domains::Companies::CompanyRelationship"
        has_many :parent_companies, through: :parent_relationships
        has_many :child_relationships, foreign_key: :parent_company_id, class_name: "Domains::Companies::CompanyRelationship"
        has_many :child_companies, through: :child_relationships
        has_many :company_contacts, class_name: "Domains::Companies::CompanyContact", dependent: :destroy
        has_many :company_ethnicity_stats, class_name: "Domains::Companies::CompanyEthnicityStat", dependent: :destroy
        has_many :company_gender_stats, class_name: "Domains::Companies::CompanyGenderStat", dependent: :destroy
        has_many :products, class_name: "Domains::Products::Product", dependent: :destroy
        has_many :cit_records, class_name: "Domains::CroupierCore::CitRecord", dependent: :destroy
        has_many :reviews, as: :reviewable, class_name: "Domains::Features::Reviewable::Review", dependent: :destroy
        has_many :addresses, as: :addressable, class_name: "Domains::ContactAndIdentity::Address", dependent: :destroy
        has_one :company_snapshot, class_name: "Domains::Companies::CompanySnapshot", dependent: :destroy
        
        accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
        accepts_nested_attributes_for :parent_relationships, reject_if: :all_blank
        accepts_nested_attributes_for :child_relationships, reject_if: :all_blank
        accepts_nested_attributes_for :company_contacts, reject_if: :all_blank
        accepts_nested_attributes_for :company_snapshot, reject_if: :all_blank

        validates :name, presence: true

        default_scope -> { order(name: :asc) }
        
        after_create :create_snapshot
        before_destroy :remove_logo_from_s3

        self.table_name = "companies"

        def self.searchable_fields
          %i[name]
        end

        index_name "company_search_index"

        def level_1_flag
          name.present? && industry_category_type_id.present? #&& !established.blank?
        end

        def level_2_flag
          addresses.any? || false
        end

        def level_3_flag
          parent_relationships.compact.any? || child_relationships.compact.any? 
        end

        def level_4_flag
          company_contacts.any? && company_contacts.first.person_id.present?
        end

        def level_5_flag
          return false unless company_snapshot

          !company_snapshot.slice(:employee_demographics_transparency, 
                  :employee_demographics_performance, :projected_culture_and_identity, 
                  :mgmt_composition_transparency, :mgmt_composition_performance)
                           .values.all? { |v| v == "none" }
        end


        def self.spawn_new_instance(cit_rec, company_name, user_id)
            if cit_rec
              old_company = cit_rec.company
              if old_company && old_company.name != company_name
                sys_gen_mid = Domains::CroupierCore::CitRecord.generate_mid(old_company.id)
                Domains::CroupierCore::CitRecordHandler
                  .update_or_create(nil, mid: sys_gen_mid, source: "Product Import",
                  user_id: user_id, company_id: old_company.id, brand: nil)
            
              end
            end

            company = Domains::Companies::Company.create!(name: company_name)
            
            if cit_rec
              cit_rec.update(company_id: company.id) if cit_rec.company_id != company.id
            else
              Domains::CroupierCore::CitRecordHandler.update_or_create(nil, mid: mid, source: "Product Import",
                                                user_id: user_id, company_id: company.id, brand: nil)
            end
            company.id
        end


        private


        def remove_logo_from_s3
          return if logo.blank?

            logo.remove!
          
        end

        def create_snapshot
          Domains::Companies::CompanySnapshot.create!(company_id: id,
          employee_demographics_transparency: 0, 
                  employee_demographics_performance: 0, projected_culture_and_identity: 0, 
                  mgmt_composition_transparency: 0, mgmt_composition_performance: 0)
        end

      end
  end
end
