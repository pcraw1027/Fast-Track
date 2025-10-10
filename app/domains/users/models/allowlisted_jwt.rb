module Domains
  module Users
    class AllowlistedJwt < ApplicationRecord
      self.table_name = "allowlisted_jwts"
    end
  end
end