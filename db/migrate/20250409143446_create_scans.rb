class CreateScans < ActiveRecord::Migration[6.1]
  def change
    create_table :scans do |t|
      t.references :product, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :scan_date
      t.string :barcode
      t.boolean :product_exists

      t.timestamps
    end
  end
end