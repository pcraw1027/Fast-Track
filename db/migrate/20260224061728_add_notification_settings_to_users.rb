class AddNotificationSettingsToUsers < ActiveRecord::Migration[6.1]

  def change
    add_column :users, :device_token, :string
    add_column :users, :notification_settings, :jsonb, null: false, default: Domains::Users::User::DEFAULT_NOTIFICATION_SETTINGS

    add_index :users, :notification_settings, using: :gin, opclass: :jsonb_path_ops
  end
  
end
