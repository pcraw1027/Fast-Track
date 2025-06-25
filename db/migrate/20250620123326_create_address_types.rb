class CreateAddressTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :address_types do |t|
      t.string :name
      t.boolean :is_person_address,  null: false, default: false

      t.timestamps
    end
  end
end

 