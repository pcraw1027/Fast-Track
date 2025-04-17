class CreateCompanyRelationshipTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :company_relationship_types do |t|
      t.string :relationship
      t.string :definition

      t.timestamps
    end
  end
end
