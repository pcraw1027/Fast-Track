class ChangeCompanyIndustryCatType < ActiveRecord::Migration[6.1]
  def change
    change_column_null :companies, :industry_category_type_id, true
  end
end
