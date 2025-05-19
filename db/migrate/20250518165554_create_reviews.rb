class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :rating, null: false
      t.text :comment
      t.text :title
      t.timestamps
    end

    add_index :reviews, [:reviewable_type, :reviewable_id]
    add_index :reviews, [:reviewable_id, :reviewable_type, :rating], name: "index_reviews_on_reviewable_and_rating"
    
    #for my scans
    add_index :scans, [:user_id, :barcode, :created_at],
              order: { created_at: :desc },
              where: "product_exists = true",
              name: "index_scans_user_barcode_created_at_filtered"

    
     #top scans
     add_index :scans, [:product_id, :id]
     add_index :reviews, :rating

  end

end
