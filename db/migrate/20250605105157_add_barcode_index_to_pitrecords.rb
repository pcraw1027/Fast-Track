class AddBarcodeIndexToPitrecords < ActiveRecord::Migration[6.1]
  def change
    add_index :pit_records, :barcode, unique: true
  end
  
end
