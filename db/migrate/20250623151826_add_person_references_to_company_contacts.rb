class AddPersonReferencesToCompanyContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :company_contacts, :person, null: false, foreign_key: true
  end
end
