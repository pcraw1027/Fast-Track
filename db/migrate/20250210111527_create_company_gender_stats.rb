class CreateCompanyGenderStats < ActiveRecord::Migration[6.1]
  def change
    create_table :company_gender_stats do |t|
      t.references :company, null: false, foreign_key: true
      t.references :gender_type, null: false, foreign_key: true
      t.references :employee_type, null: false, foreign_key: true
      t.integer :count
      t.integer :percentage

      t.timestamps
    end
  end
end
