module Domains
  module ContactAndIdentity
    class Address < ApplicationRecord
      belongs_to :address_type, class_name: "Domains::ContactAndIdentity::AddressType", foreign_key: "address_type_id"
      belongs_to :country_reference, class_name: "Domains::ContactAndIdentity::CountryReference", foreign_key: "country_reference_id"     
      belongs_to :addressable, polymorphic: true
      validates :address1, :city, :state, :postal_code, presence: true
      self.table_name = "addresses"
    end
  end
end

