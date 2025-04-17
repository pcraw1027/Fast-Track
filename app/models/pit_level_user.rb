class PitLevelUser < ApplicationRecord
  belongs_to :pit_record
  belongs_to :user

end
