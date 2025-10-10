module Domains
  module Companies
    class CompanySnapshot < ApplicationRecord
      belongs_to :company, class_name: "Domains::Companies::Company"     
      enum employee_demographics_transparency: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
      enum employee_demographics_performance: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
      enum projected_culture_and_identity: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
      enum mgmt_composition_transparency: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
      enum mgmt_composition_performance: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
      self.table_name = "company_snapshots"
    end
  end
end

