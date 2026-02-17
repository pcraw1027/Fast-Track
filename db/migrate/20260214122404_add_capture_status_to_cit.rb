class AddCaptureStatusToCit < ActiveRecord::Migration[6.1]
  def change
    add_column :cit_records, :capture_status, :integer, null: false, default: 0
    add_index :cit_records, [:capture_status], name: "index_cit_on_capture_status"
  end
end
