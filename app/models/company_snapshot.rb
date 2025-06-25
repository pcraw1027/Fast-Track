class CompanySnapshot < ApplicationRecord
  belongs_to :company
  enum data_transparency: {none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
  enum internal_culture: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
  enum mgmt_composition: { none: 0, poor: 1, average: 2, good: 3 }, _prefix: true
end
