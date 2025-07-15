class CitRecord < ApplicationRecord
  belongs_to :company, optional: true
  has_many :cit_level_users
  validates :mid, uniqueness: true
  default_scope -> { order(product_activity_count: :desc, updated_at: :desc) }
  scope :by_level, -> (cit_level) { includes(:company, :cit_level_users).where('level = ?', cit_level) }

  scope :for_parent_companies, -> {
      joins(company: :child_relationships)
        .includes(:company, :cit_level_users)
        .distinct
    }


  scope :for_child_only_companies, -> {
      joins(:company)
        .left_outer_joins(company: :child_relationships) # Check they’re not parents
        .joins(company: :parent_relationships)            # But they are children
        .where(child_relationships: { id: nil }) # i.e., no child_relationships
        .includes(:company, :cit_level_users)
        .distinct
    }


  scope :for_companies_with_products, -> {
            joins(company: :products)
            .includes(:company)
            .distinct
      }

  


  def self.generate_mid(company_id)
    base_mid = "C#{company_id}".ljust(8, '0')
    mid = base_mid
    suffix = 1
    while CitRecord.exists?(mid: mid)
      mid = "#{base_mid}#{suffix}"
      suffix += 1
    end
    mid
  end  

end

