class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    
    create_table :products do |t|
      t.references :company, null: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :qrcode
      t.string :size
      t.references :segment, null: true, foreign_key: true
      t.references :family, null: true, foreign_key: true
      t.references :klass, null: true, foreign_key: true
      t.references :brick, null: true, foreign_key: true

      t.timestamps
    end

    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :barcode
      t.string :image

      t.timestamps
    end
    add_index :product_variants, :barcode, unique: true
  end
end
