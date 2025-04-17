class CreateCompanyContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :company_contacts do |t|
      t.references :company, null: false, foreign_key: true
      t.references :company_contact_type, null: false, foreign_key: true
      t.string :name
      t.string :job_title
      t.string :email
      t.string :phone
      t.string :photo

      t.timestamps
    end
  end
end
