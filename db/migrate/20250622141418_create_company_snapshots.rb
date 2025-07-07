class CreateCompanySnapshots < ActiveRecord::Migration[6.1]
  def change
    create_table :company_snapshots do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :employee_demographics_transparency
      t.integer :employee_demographics_performance
      t.integer :projected_culture_and_identity
      t.integer :mgmt_composition_transparency
      t.integer :mgmt_composition_performance

      t.timestamps
    end
  end
end
