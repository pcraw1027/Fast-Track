class CreateCountryReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :country_references do |t|
      t.string :country_code
      t.string :country

      t.timestamps
    end
  end
end
