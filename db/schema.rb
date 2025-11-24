# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_11_19_181102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.string "name"
    t.boolean "is_person_address", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "address_type_id", null: false
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.bigint "country_reference_id", null: false
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["country_reference_id"], name: "index_addresses_on_country_reference_id"
  end

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.string "jti", null: false
    t.string "aud"
    t.datetime "exp", null: false
    t.bigint "user_id", null: false
    t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
    t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
  end

  create_table "attribute_titles", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "description"
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_source_id"], name: "index_attribute_titles_on_product_category_source_id"
  end

  create_table "attribute_values", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "description"
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_source_id"], name: "index_attribute_values_on_product_category_source_id"
  end

  create_table "bit_records", force: :cascade do |t|
    t.string "barcode", default: "", null: false
    t.string "asin"
    t.integer "status", default: 0, null: false
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "symbology", default: "UNKNOWN", null: false
    t.index ["barcode", "source"], name: "index_bit_records_on_barcode_and_source", unique: true
  end

  create_table "bricks", force: :cascade do |t|
    t.integer "code"
    t.string "title"
    t.string "description"
    t.bigint "klass_id", null: false
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["klass_id"], name: "index_bricks_on_klass_id"
    t.index ["product_category_source_id"], name: "index_bricks_on_product_category_source_id"
  end

  create_table "cit_level_users", force: :cascade do |t|
    t.integer "level", default: 0, null: false
    t.bigint "user_id"
    t.bigint "cit_record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cit_record_id"], name: "index_cit_level_users_on_cit_record_id"
    t.index ["user_id"], name: "index_cit_level_users_on_user_id"
  end

  create_table "cit_records", force: :cascade do |t|
    t.bigint "product_activity_count", default: 0, null: false
    t.string "mid", default: "", null: false
    t.integer "level", default: 0, null: false
    t.bigint "product_orphan_count", default: 0, null: false
    t.string "source"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand", default: ""
    t.index ["company_id"], name: "index_cit_records_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.bigint "industry_category_type_id"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.date "established"
    t.string "website"
    t.string "diversity_report"
    t.integer "diversity_score"
    t.integer "total_employees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sector", default: ""
    t.string "postal_code"
    t.bigint "searches", default: 0, null: false
    t.boolean "black_owned", default: false, null: false
    t.boolean "female_owned", default: false, null: false
    t.index ["industry_category_type_id"], name: "index_companies_on_industry_category_type_id"
  end

  create_table "company_contact_types", force: :cascade do |t|
    t.string "role"
    t.string "definition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_contacts", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "company_contact_type_id", null: false
    t.string "name"
    t.string "job_title"
    t.string "email"
    t.string "phone"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "person_id", null: false
    t.index ["company_contact_type_id"], name: "index_company_contacts_on_company_contact_type_id"
    t.index ["company_id"], name: "index_company_contacts_on_company_id"
    t.index ["person_id"], name: "index_company_contacts_on_person_id"
  end

  create_table "company_ethnicity_stats", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "ethnicity_type_id", null: false
    t.bigint "employee_type_id", null: false
    t.integer "count"
    t.integer "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_ethnicity_stats_on_company_id"
    t.index ["employee_type_id"], name: "index_company_ethnicity_stats_on_employee_type_id"
    t.index ["ethnicity_type_id"], name: "index_company_ethnicity_stats_on_ethnicity_type_id"
  end

  create_table "company_gender_stats", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "gender_type_id", null: false
    t.bigint "employee_type_id", null: false
    t.integer "count"
    t.integer "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_gender_stats_on_company_id"
    t.index ["employee_type_id"], name: "index_company_gender_stats_on_employee_type_id"
    t.index ["gender_type_id"], name: "index_company_gender_stats_on_gender_type_id"
  end

  create_table "company_relationship_types", force: :cascade do |t|
    t.string "relationship"
    t.string "definition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_relationships", force: :cascade do |t|
    t.bigint "company_relationship_type_id", null: false
    t.bigint "parent_company_id", null: false
    t.bigint "child_company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_company_id"], name: "index_company_relationships_on_child_company_id"
    t.index ["company_relationship_type_id"], name: "index_company_relationships_on_company_relationship_type_id"
    t.index ["parent_company_id"], name: "index_company_relationships_on_parent_company_id"
  end

  create_table "company_snapshots", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.integer "employee_demographics_transparency"
    t.integer "employee_demographics_performance"
    t.integer "projected_culture_and_identity"
    t.integer "mgmt_composition_transparency"
    t.integer "mgmt_composition_performance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_snapshots_on_company_id"
  end

  create_table "country_references", force: :cascade do |t|
    t.string "country_code"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "employee"
    t.string "definition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ethnicity_types", force: :cascade do |t|
    t.string "ethnicity"
    t.string "definition"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer "code"
    t.string "title"
    t.string "description"
    t.bigint "segment_id", null: false
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_source_id"], name: "index_families_on_product_category_source_id"
    t.index ["segment_id"], name: "index_families_on_segment_id"
  end

  create_table "gender_types", force: :cascade do |t|
    t.string "gender"
    t.string "definition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "industry_category_types", force: :cascade do |t|
    t.string "category_code"
    t.string "title"
    t.integer "naics_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_code"], name: "index_industry_category_types_on_category_code", unique: true
  end

  create_table "invitations", force: :cascade do |t|
    t.string "invite_code"
    t.string "email"
    t.string "username"
    t.string "country"
    t.string "postal_code"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "invited_by_id"
    t.string "first_name", null: false
    t.string "last_name"
    t.index ["invite_code"], name: "index_invitations_on_invite_code", unique: true
    t.index ["invited_by_id"], name: "index_invitations_on_invited_by_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.integer "code"
    t.string "title"
    t.string "description"
    t.bigint "family_id", null: false
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_klasses_on_family_id"
    t.index ["product_category_source_id"], name: "index_klasses_on_product_category_source_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "mediaable_type", null: false
    t.bigint "mediaable_id", null: false
    t.string "file"
    t.integer "position", default: 1, null: false
    t.integer "media_type", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_tmp"
    t.index ["mediaable_type", "mediaable_id"], name: "index_media_on_mediaable"
  end

  create_table "people", force: :cascade do |t|
    t.string "title"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "phone"
    t.string "letters"
    t.bigint "gender_type_id"
    t.bigint "ethnicity_type_id"
    t.bigint "country_reference_id"
    t.string "picture"
    t.string "email"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_reference_id"], name: "index_people_on_country_reference_id"
    t.index ["ethnicity_type_id"], name: "index_people_on_ethnicity_type_id"
    t.index ["gender_type_id"], name: "index_people_on_gender_type_id"
  end

  create_table "person_social_sites", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "social_site_id", null: false
    t.string "profile_link", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id", "social_site_id"], name: "index_person_social_sites_on_person_id_and_social_site_id", unique: true
    t.index ["person_id"], name: "index_person_social_sites_on_person_id"
    t.index ["social_site_id"], name: "index_person_social_sites_on_social_site_id"
  end

  create_table "pit_level_users", force: :cascade do |t|
    t.integer "level", default: 0, null: false
    t.bigint "user_id"
    t.bigint "pit_record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pit_record_id"], name: "index_pit_level_users_on_pit_record_id"
    t.index ["user_id"], name: "index_pit_level_users_on_user_id"
  end

  create_table "pit_records", force: :cascade do |t|
    t.bigint "product_activity_count", default: 0, null: false
    t.string "barcode", default: "", null: false
    t.string "asin", default: ""
    t.integer "level", default: 0, null: false
    t.string "source"
    t.bigint "product_id"
    t.string "mid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barcode"], name: "index_pit_records_on_barcode", unique: true
    t.index ["product_id"], name: "index_pit_records_on_product_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "product_id", null: false
    t.bigint "brick_id", null: false
    t.bigint "attribute_title_id", null: false
    t.bigint "attribute_value_id", null: false
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attribute_title_id"], name: "index_product_attributes_on_attribute_title_id"
    t.index ["attribute_value_id"], name: "index_product_attributes_on_attribute_value_id"
    t.index ["brick_id"], name: "index_product_attributes_on_brick_id"
    t.index ["company_id"], name: "index_product_attributes_on_company_id"
    t.index ["product_category_source_id"], name: "index_product_attributes_on_product_category_source_id"
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "product_category_sources", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "barcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barcode"], name: "index_product_variants_on_barcode", unique: true
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "description"
    t.string "qrcode"
    t.string "size"
    t.bigint "segment_id"
    t.bigint "family_id"
    t.bigint "klass_id"
    t.bigint "brick_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_category_source_id", null: false
    t.bigint "searches", default: 0, null: false
    t.index ["brick_id"], name: "index_products_on_brick_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["family_id"], name: "index_products_on_family_id"
    t.index ["klass_id"], name: "index_products_on_klass_id"
    t.index ["segment_id"], name: "index_products_on_segment_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating", null: false
    t.text "comment"
    t.text "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rating"], name: "index_reviews_on_rating"
    t.index ["reviewable_id", "reviewable_type", "rating"], name: "index_reviews_on_reviewable_and_rating"
    t.index ["reviewable_id", "reviewable_type", "user_id"], name: "index_reviews_on_reviewable_and_user", unique: true
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "scans", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id", null: false
    t.datetime "scan_date"
    t.string "barcode"
    t.boolean "product_exists"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id", "id"], name: "index_scans_on_product_id_and_id"
    t.index ["product_id"], name: "index_scans_on_product_id"
    t.index ["user_id", "barcode", "created_at"], name: "index_scans_user_barcode_created_at_filtered", order: { created_at: :desc }, where: "(product_exists = true)"
    t.index ["user_id"], name: "index_scans_on_user_id"
  end

  create_table "segments", force: :cascade do |t|
    t.integer "code"
    t.string "title"
    t.string "description"
    t.bigint "product_category_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_source_id"], name: "index_segments_on_product_category_source_id"
  end

  create_table "social_sites", force: :cascade do |t|
    t.string "site_code"
    t.string "site"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "upload_records", force: :cascade do |t|
    t.bigint "scan_id", null: false
    t.bigint "user_id", null: false
    t.boolean "resolve_status"
    t.date "date"
    t.string "barcode"
    t.string "product_name"
    t.string "company_name"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scan_id"], name: "index_upload_records_on_scan_id"
    t.index ["user_id"], name: "index_upload_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "country", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "invite_code"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.string "photo", default: ""
    t.string "avatar", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.boolean "app_notify_on", default: true, null: false
    t.boolean "email_notify_on", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "website_messages", force: :cascade do |t|
    t.string "sender_name", null: false
    t.string "sender_email", null: false
    t.string "message_type", null: false
    t.string "message_subject"
    t.string "interest"
    t.text "message_content"
    t.boolean "sender_response_sent", default: false, null: false
    t.boolean "internal_response_sent", default: false, null: false
    t.boolean "initial_response", default: false, null: false
    t.datetime "initial_response_date"
    t.text "conclusion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "country_references"
  add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  add_foreign_key "attribute_titles", "product_category_sources"
  add_foreign_key "attribute_values", "product_category_sources"
  add_foreign_key "bricks", "klasses"
  add_foreign_key "bricks", "product_category_sources"
  add_foreign_key "cit_level_users", "cit_records"
  add_foreign_key "cit_level_users", "users"
  add_foreign_key "cit_records", "companies"
  add_foreign_key "companies", "industry_category_types"
  add_foreign_key "company_contacts", "companies"
  add_foreign_key "company_contacts", "company_contact_types"
  add_foreign_key "company_contacts", "people"
  add_foreign_key "company_ethnicity_stats", "companies"
  add_foreign_key "company_ethnicity_stats", "employee_types"
  add_foreign_key "company_ethnicity_stats", "ethnicity_types"
  add_foreign_key "company_gender_stats", "companies"
  add_foreign_key "company_gender_stats", "employee_types"
  add_foreign_key "company_gender_stats", "gender_types"
  add_foreign_key "company_relationships", "companies", column: "child_company_id"
  add_foreign_key "company_relationships", "companies", column: "parent_company_id"
  add_foreign_key "company_relationships", "company_relationship_types"
  add_foreign_key "company_snapshots", "companies"
  add_foreign_key "families", "product_category_sources"
  add_foreign_key "families", "segments"
  add_foreign_key "invitations", "users", column: "invited_by_id"
  add_foreign_key "klasses", "families"
  add_foreign_key "klasses", "product_category_sources"
  add_foreign_key "people", "country_references"
  add_foreign_key "people", "ethnicity_types"
  add_foreign_key "people", "gender_types"
  add_foreign_key "person_social_sites", "people"
  add_foreign_key "person_social_sites", "social_sites"
  add_foreign_key "pit_level_users", "pit_records"
  add_foreign_key "pit_level_users", "users"
  add_foreign_key "pit_records", "products"
  add_foreign_key "product_attributes", "attribute_titles"
  add_foreign_key "product_attributes", "attribute_values"
  add_foreign_key "product_attributes", "bricks"
  add_foreign_key "product_attributes", "companies"
  add_foreign_key "product_attributes", "product_category_sources"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "bricks"
  add_foreign_key "products", "companies"
  add_foreign_key "products", "families"
  add_foreign_key "products", "klasses"
  add_foreign_key "products", "segments"
  add_foreign_key "reviews", "users"
  add_foreign_key "scans", "products"
  add_foreign_key "scans", "users"
  add_foreign_key "segments", "product_category_sources"
  add_foreign_key "upload_records", "scans"
  add_foreign_key "upload_records", "users"
end
