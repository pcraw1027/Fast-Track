class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.references :industry_category_type, null: false, foreign_key: true
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.date :established
      t.string :website
      t.string :diversity_report
      t.integer :diversity_score
      t.integer :total_employees

      t.timestamps
    end
  end
end
