class CitLevelUser < ApplicationRecord
  belongs_to :cit_record
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
