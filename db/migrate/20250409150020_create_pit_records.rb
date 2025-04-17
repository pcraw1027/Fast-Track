class CreatePitRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :pit_records do |t|
      t.bigint :product_activity_count, null: false, default: 0
      t.string :barcode,              null: false, default: ""
      t.string :asin,              null: true, default: ""
      t.integer :level, null: false, default: 0
      t.string :source
      t.references :product, null: true, foreign_key: true
      t.string :mid

      t.timestamps
    end

    create_table :pit_level_users do |t|
      t.integer :level, null: false, default: 0
      t.references :user, null: true, foreign_key: true
      t.references :pit_record, null: true, foreign_key: true

      t.timestamps
    end


  end
end
