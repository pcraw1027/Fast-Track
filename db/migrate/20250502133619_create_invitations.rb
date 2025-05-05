class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
     # t.bigint :invited_by_id
      t.string :invite_code
      t.string :email
      t.string :username
      t.string :country
      t.string :postal_code
      t.integer :status

      t.timestamps
    end
    add_index :invitations, :invite_code, unique: true
    add_index :users, :username, unique: true
    add_reference :invitations, :invited_by, foreign_key: { to_table: :users }
  end
end
