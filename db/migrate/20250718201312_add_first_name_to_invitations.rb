class AddFirstNameToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :first_name, :string,  null: false
    add_column :invitations, :last_name, :string
  end
end
