class CreateProductCategorySources < ActiveRecord::Migration[6.1]
  def change
    create_table :product_category_sources do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
