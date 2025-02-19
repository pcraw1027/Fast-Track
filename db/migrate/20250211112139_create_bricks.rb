class CreateBricks < ActiveRecord::Migration[6.1]
  def change
    create_table :bricks do |t|
      t.integer :code
      t.string :title
      t.string :description
      t.references :klass, null: false, foreign_key: true
      t.references :product_category_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
