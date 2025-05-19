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
    
    #top scans
    add_index :pit_records, :barcode, where: "level >= 1", name: "index_pit_on_b_where_level_gte_1"
    add_index :pit_records, [:barcode, :level, :product_activity_count], name: "index_pit_on_b_level_activity"
    add_index :scans, :barcode

    #for my scans
     add_index :scans, :product_id
     add_index :scans, [:product_id, :id]

     add_index :product_variants, :product_id
     add_index :products, :company_id
     add_index :reviews, :rating


   
  end

end
