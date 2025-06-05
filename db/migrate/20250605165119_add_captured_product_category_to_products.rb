class AddCapturedProductCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :captured_product_category, :string
  end
end
