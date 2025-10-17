class RemoveMidsFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_index :companies, :mids if index_exists?(:companies, :mids)
    remove_column :companies, :mids, :text, array: true, default: []
  end
end
