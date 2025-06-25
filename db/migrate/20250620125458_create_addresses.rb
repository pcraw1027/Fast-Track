class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :address_type, null: false, foreign_key: true
      t.references :addressable, polymorphic: true, null: false
      t.references :country_reference, null: false, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
      
  end
end
