class CreateUploadRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :upload_records do |t|
      t.references :scan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :resolve_status
      t.date :date
      t.string :barcode
      t.string :product_name
      t.string :company_name
      t.text :remarks
      t.string :image

      t.timestamps
    end
  end
end
