class Address < ApplicationRecord
  belongs_to :address_type
  belongs_to :country_reference
  belongs_to :addressable, polymorphic: true
  validates :address1, :city, :state, :postal_code, presence: true
end
