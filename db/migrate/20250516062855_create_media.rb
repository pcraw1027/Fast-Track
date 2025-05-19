class CreateMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :media do |t|
      t.references :mediaable, polymorphic: true, null: false
      t.string :file
      t.integer :position,              null: false, default: 1
      t.integer :media_type,              null: false, default: 0

      t.timestamps
    end
    
  end
end




