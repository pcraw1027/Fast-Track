class CreateCompanyEthnicityStats < ActiveRecord::Migration[6.1]
  def change
    create_table :company_ethnicity_stats do |t|
      t.references :company, null: false, foreign_key: true
      t.references :ethnicity_type, null: false, foreign_key: true
      t.references :employee_type, null: false, foreign_key: true
      t.integer :count
      t.integer :percentage

      t.timestamps
    end
  end
end
