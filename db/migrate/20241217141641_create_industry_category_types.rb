class CreateIndustryCategoryTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :industry_category_types do |t|
      t.string :category_code
      t.string :title
      t.integer :naics_year


      t.timestamps
    end
  end
end
