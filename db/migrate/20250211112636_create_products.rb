class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :barcode
      t.string :qrcode
      t.string :size
      t.references :segment, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.references :klass, null: false, foreign_key: true
      t.references :brick, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
