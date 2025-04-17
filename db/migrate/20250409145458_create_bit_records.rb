class CreateBitRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :bit_records do |t|
      t.string :barcode,              null: false, default: ""
      t.string :asin
      t.integer :status, null: false, default: 0
      t.string :source

      t.timestamps
    end
  
    add_index :bit_records, [:barcode, :source], unique: true
    add_column :companies, :mids, :text, array:true, default: []
  end
end
