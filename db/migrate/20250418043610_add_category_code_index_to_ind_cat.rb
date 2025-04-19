class AddCategoryCodeIndexToIndCat < ActiveRecord::Migration[6.1]
  def change
    add_index :industry_category_types, :category_code, unique: true
    add_column :products, :product_category_source_id, :bigint, null: false, foreign_key: true
  end
end
