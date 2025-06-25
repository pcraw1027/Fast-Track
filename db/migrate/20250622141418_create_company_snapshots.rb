class CreateCompanySnapshots < ActiveRecord::Migration[6.1]
  def change
    create_table :company_snapshots do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :data_transparency
      t.integer :internal_culture
      t.integer :mgmt_composition

      t.timestamps
    end
  end
end
