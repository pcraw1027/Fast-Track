class CreatePersonSocialSites < ActiveRecord::Migration[6.1]
  def change
    create_table :person_social_sites do |t|
      t.references :person, null: false, foreign_key: true
      t.references :social_site, null: false, foreign_key: true
      t.string :profile_link, null: false
      t.timestamps
    end

    add_index :person_social_sites, [:person_id, :social_site_id], unique: true

  end
end
