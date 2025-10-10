module Domains
  module CroupierCore
    class CitLevelUser < ApplicationRecord
      belongs_to :cit_record, class_name: "Domains::CroupierCore::CitRecord", foreign_key: "cit_record_id"       
      belongs_to :user, class_name: "Domains::Users::User", foreign_key: "user_id"
      default_scope -> { order(created_at: :desc) }
      self.table_name = "cit_level_users"
    end
  end
end
