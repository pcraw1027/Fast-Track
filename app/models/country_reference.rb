class CountryReference < ApplicationRecord
  default_scope -> { order(country: :asc) }
  
end
