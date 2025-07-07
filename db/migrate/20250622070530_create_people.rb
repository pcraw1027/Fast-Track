class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :letters
      t.references :gender_type, null: true, foreign_key: true
      t.references :ethnicity_type, null: true, foreign_key: true
      t.references :country_reference, null: true, foreign_key: true
      t.string :picture
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
