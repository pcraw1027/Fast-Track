json.extract! address, :id, :address_type_id, :addressable_id, :address1, :address2, :city, :state, :postal_code, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
