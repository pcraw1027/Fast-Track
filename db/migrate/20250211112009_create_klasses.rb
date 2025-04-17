class CreateKlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :klasses do |t|
      t.integer :code
      t.string :title
      t.string :description
      t.references :family, null: false, foreign_key: true
      t.references :product_category_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
