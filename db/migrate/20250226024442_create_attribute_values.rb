class CreateAttributeValues < ActiveRecord::Migration[6.1]
  def change
    create_table :attribute_values do |t|
      t.string :code
      t.string :title
      t.string :description
      t.references :product_category_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
