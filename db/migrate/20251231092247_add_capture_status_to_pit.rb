class AddCaptureStatusToPit < ActiveRecord::Migration[6.1]
  def change
    add_column :pit_records, :capture_status, :integer, null: false, default: 0
    add_index :pit_records, [:capture_status], name: "index_pit_on_capture_status"
  end
end
