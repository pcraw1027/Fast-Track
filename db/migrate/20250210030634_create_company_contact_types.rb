class CreateCompanyContactTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :company_contact_types do |t|
      t.string :role
      t.string :definition

      t.timestamps
    end
  end
end
