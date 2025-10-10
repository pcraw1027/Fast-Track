module Domains
  module ContactAndIdentity
    class CountryReference < ApplicationRecord
      default_scope -> { order(country: :asc) }
      self.table_name = "country_references"
    end
  end
end
