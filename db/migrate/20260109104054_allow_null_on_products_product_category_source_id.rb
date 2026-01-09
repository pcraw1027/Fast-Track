class AllowNullOnProductsProductCategorySourceId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :products, :product_category_source_id, true
  end
end
