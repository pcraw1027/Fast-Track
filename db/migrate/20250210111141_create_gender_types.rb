class CreateGenderTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :gender_types do |t|
      t.string :gender
      t.string :definition

      t.timestamps
    end
  end
end
