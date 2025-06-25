class CreateSocialSites < ActiveRecord::Migration[6.1]
  def change
    create_table :social_sites do |t|
      t.string :site_code
      t.string :site

      t.timestamps
    end
  end
end
