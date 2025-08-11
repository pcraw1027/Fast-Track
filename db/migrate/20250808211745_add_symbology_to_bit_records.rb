class AddSymbologyToBitRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :bit_records, :symbology, :string,  null: false, default: "UNKNOWN"
  end
end
