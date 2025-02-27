class CreateCompanyRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :company_relationships do |t|
      t.references :company_relationship_type, null: false, foreign_key: true
      t.references :parent_company, null: false, foreign_key: {to_table: :companies}
      t.references :child_company, null: false, foreign_key: {to_table: :companies}

      t.timestamps
    end
  end
end
