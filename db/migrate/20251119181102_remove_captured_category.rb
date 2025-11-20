class RemoveCapturedCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :captured_product_category, :string if column_exists?(:products, :captured_product_category)
  end
end
