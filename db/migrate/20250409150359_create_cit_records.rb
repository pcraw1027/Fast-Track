class CreateCitRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :cit_records do |t|
      t.bigint :product_activity_count, null: false, default: 0
      t.string :mid,              null: false, default: ""
      t.string :company_name
      t.integer :level, null: false, default: 0
      t.bigint :product_orphan_count, null: false, default: 0
      t.string :source
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end

<<<<<<< HEAD
    create_table :cit_level_users do |t|
=======
    create_table :cit_users do |t|
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
      t.integer :level, null: false, default: 0
      t.references :user, null: true, foreign_key: true
      t.references :cit_record, null: true, foreign_key: true

      t.timestamps
    end

<<<<<<< HEAD
=======

>>>>>>> f23b7e48ec63383043386d1601ad646396189564
  end
end
