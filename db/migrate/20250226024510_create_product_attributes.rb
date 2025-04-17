class CreateProductAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_attributes do |t|
      t.references :company, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :brick, null: false, foreign_key: true
      t.references :attribute_title, null: false, foreign_key: true
      t.references :attribute_value, null: false, foreign_key: true
      t.references :product_category_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
