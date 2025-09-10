class CreateWebsiteMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :website_messages do |t|
      t.string :sender_name, null: false
      t.string :sender_email, null: false
      t.string :message_type, null: false
      t.string :message_subject
      t.string :interest
      t.text :message_content
      
      t.boolean :sender_response_sent, default: false, null: false
      t.boolean :internal_response_sent, default: false, null: false
      t.boolean :initial_response, default: false, null: false
      t.datetime :initial_response_date
      t.text :conclusion

      t.timestamps
    end
  end
end
