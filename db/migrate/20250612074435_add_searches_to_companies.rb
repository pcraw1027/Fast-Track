class AddSearchesToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :searches, :bigint, null: false, default: 0
    add_column :companies, :black_owned, :boolean,  null: false, default: false
    add_column :companies, :female_owned, :boolean,  null: false, default: false
    add_column :products, :searches, :bigint, null: false, default: 0
  end
end
