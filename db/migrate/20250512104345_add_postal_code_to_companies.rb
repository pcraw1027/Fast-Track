class AddPostalCodeToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :postal_code, :string
  end
end
