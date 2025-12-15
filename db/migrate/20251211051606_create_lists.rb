class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :list_type, default: 0, null: false
      t.boolean :default, default: false, null: false
      t.text :description
      t.boolean :snapshot_aggregate, default: false, null: false

      t.timestamps
    end
    add_index :lists, [:user_id, :name], unique: true
    add_index :lists, [:user_id, :default]

    add_index :lists, [:user_id], name: "index_list_res_on_user"

    create_table :list_resources do |t|
      t.references :listable, polymorphic: true, null: true
      t.references :list, null: false, foreign_key: true
      t.string :barcode
      t.timestamps
    end

    add_index :list_resources, [:listable_type, :listable_id], name: "index_list_res_on_listableid_and_type"
    add_index :list_resources, [:listable_id, :listable_type, :barcode], name: "index_list_res_on_listable_and_barcode"
    
    add_index :list_resources, [:listable_id, :listable_type, :list_id], name: "index_list_res_on_listable_and_list", 
unique: true

    add_column :scans, :lat, :decimal, precision: 10, scale: 6
    add_column :scans, :lng, :decimal, precision: 10, scale: 6
    add_column :scans, :address, :string
    add_column :users, :scan_to_list_mode, :boolean, null: false, default: false

    add_index :scans, [:lat, :lng]

  end
end

