class AddUniqueIndexToReviews < ActiveRecord::Migration[6.1]
  def change
    add_index :reviews, [:reviewable_id, :reviewable_type, :user_id], name: "index_reviews_on_reviewable_and_user", unique: true
  end
end
