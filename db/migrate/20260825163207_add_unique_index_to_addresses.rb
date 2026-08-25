class AddUniqueIndexToAddresses < ActiveRecord::Migration[6.1]
  def change
    # Compound unique index when all fields are present
    add_index :addresses,
              [:address_type_id, :addressable_id, :address1, :address2, :postal_code],
              unique: true,
              name: "idx_addresses_unique_composite_full"
  end
end
