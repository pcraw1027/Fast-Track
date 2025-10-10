module Domains
  module CroupierCore
    class PitLevelUser < ApplicationRecord
      belongs_to :pit_record, class_name: "Domains::CroupierCore::PitRecord", foreign_key: "pit_record_id"
      belongs_to :user, class_name: "Domains::Users::User", foreign_key: "user_id"
      self.table_name = "pit_level_users"

    end
  end
end
