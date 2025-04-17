class AddCompanyMidIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :companies, :mids, using: :gin
  end
end
