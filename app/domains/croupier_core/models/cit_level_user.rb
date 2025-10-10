module Domains
  module CroupierCore
    class CitLevelUser < ApplicationRecord
      belongs_to :cit_record, class_name: "Domains::CroupierCore::CitRecord"       
      belongs_to :user, class_name: "Domains::Users::User"
      default_scope -> { order(created_at: :desc) }
      self.table_name = "cit_level_users"
    end
  end
end
