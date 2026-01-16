class CreateCaptureHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :capture_histories do |t|
      t.string :third_party_source
      t.integer :status, null: false, default: 0
      t.string :barcode
      t.string :name

      t.timestamps
    end
  end
end
