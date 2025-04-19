class IndustryCategoryType < ApplicationRecord
    has_many :companies, dependent: :destroy
end
