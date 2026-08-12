class IndustryCategoryTypeMapping < ActiveRecord::Migration[6.1]
  def change
    create_table :industry_category_type_mappings do |t|
      t.integer :mapping_type, null: false
      t.bigint :category_code_type_from_id, null: false
      t.bigint :category_code_type_to_id, null: false
      t.timestamps
    end

    add_index :industry_category_type_mappings, [:category_code_type_from_id], name: "index_ind_c_t_m_on_category_code_type_from_id"
    add_index :industry_category_type_mappings, [:category_code_type_to_id], name: "index_ind_c_t_m_on_category_code_type_to_id"

    add_column :industry_category_types, :linkedin_version, :string 

    change_table :companies do |t|
      # Add new columns
      t.boolean :easy_scan, default: false, null: false
      t.string :symbology, default: "None", null: false

      # Remove existing address columns (type included for rollback support)
      t.remove :address_1, type: :string
      t.remove :address_2, type: :string
      t.remove :city, type: :string
      t.remove :state, type: :string
      t.remove :postal_code, type: :string
      t.remove :country, type: :string
    end

    add_column :addresses, :easy_scan, :boolean, default: false, null: false
    add_column :addresses, :symbology, :string, default: "None", null: false
    add_column :addresses, :site_location_name, :string
    add_column :addresses, :scanned, :integer, default: 0, null: false
    add_column :addresses, :lat, :decimal, precision: 10, scale: 6
    add_column :addresses, :lng, :decimal, precision: 10, scale: 6

    
    add_column :address_types, :scannable, :boolean,  null: false, default: false
    add_column :scans, :scan_mode, :integer, default: 0, null: false
    add_column :scans, :address_id, :bigint
    add_index :scans, :address_id
    add_index :scans, [:user_id, :scan_mode],
              where: "address_id IS NOT NULL",
              name: "idx_scans_user_bn_with_address"


    enable_extension 'postgis' unless extension_enabled?('postgis')

    # Creates a native geography column (SRID 4326 by default for geography)
    add_column :addresses, :lonlat, :st_point, geographic: true

    # GiST Index for KNN lookup
    add_index :addresses, :lonlat, using: :gist

    # Backfill lonlat column from existing lat/lng floats
    reversible do |dir|
      dir.up do
        execute <<~SQL.squish
          UPDATE addresses
          SET lonlat = ST_SetSRID(ST_MakePoint(lng, lat), 4326)::geography
          WHERE lat IS NOT NULL AND lng IS NOT NULL;
        SQL
      end
    end


  end
end




