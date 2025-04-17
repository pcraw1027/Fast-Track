class CreateEthnicityTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :ethnicity_types do |t|
      t.string :ethnicity
      t.string :definition
      t.string :source

      t.timestamps
    end
  end
end
