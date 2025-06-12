class AddSearchesToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :searches, :bigint, null: false, default: 0
    add_column :products, :searches, :bigint, null: false, default: 0
  end
end
