module Domains
  module CroupierCore
    class PitLevelUser < ApplicationRecord
      belongs_to :pit_record, class_name: "Domains::CroupierCore::PitRecord"
      belongs_to :user, class_name: "Domains::Users::User"
      self.table_name = "pit_level_users"

    end
  end
end
