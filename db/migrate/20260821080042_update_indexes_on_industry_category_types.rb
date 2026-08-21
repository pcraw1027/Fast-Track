class UpdateIndexesOnIndustryCategoryTypes < ActiveRecord::Migration[6.1]
  def change
    # 1. Remove old unique index on category_code
    remove_index :industry_category_types, 
                 column: :category_code, 
                 name: "index_industry_category_types_on_category_code", 
                 unique: true

    # 2. Add back a non-unique index on category_code
    add_index :industry_category_types, 
              :category_code, 
              name: "index_industry_category_types_on_category_code"

    # ------------------------------------------------------------------
    # 3. Category Code + NAICS Year Uniqueness
    # ------------------------------------------------------------------
    # When naics_year is present
    add_index :industry_category_types, 
              [:category_code, :naics_year], 
              unique: true, 
              where: "naics_year IS NOT NULL",
              name: "idx_ind_cat_types_unique_code_and_year"

    # ------------------------------------------------------------------
    # 4. Category Code + LinkedIn Version Uniqueness
    # ------------------------------------------------------------------
    # When linkedin_version is present
    add_index :industry_category_types, 
              [:category_code, :linkedin_version], 
              unique: true, 
              where: "linkedin_version IS NOT NULL",
              name: "idx_ind_cat_types_unique_code_and_linkedin_ver"

  end
end