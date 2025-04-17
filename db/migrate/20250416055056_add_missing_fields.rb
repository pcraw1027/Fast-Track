class AddMissingFields < ActiveRecord::Migration[6.1]
  def change
    add_column :bit_records, :user_id, :bigint, null: false, foreign_key: true
    add_column :cit_records, :brand, :string, null: true, default: ""
    add_column :users, :status, :integer, null: false, default: 0
    add_column :users, :photo, :string, null: true, default: ""
    add_column :users, :avatar, :string, null: true, default: ""
    add_column :users, :first_name, :string, null: true, default: ""
    add_column :users, :last_name, :string, null: true, default: ""
    add_column :users, :app_notify_on, :boolean,  null: false, default: true
    add_column :users, :email_notify_on, :boolean,  null: false, default: true
    add_column :companies, :sector, :string, null: true, default: ""
  end
end


