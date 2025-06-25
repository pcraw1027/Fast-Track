json.extract! person, :id, :title, :first_name, :middle_name, :last_name, :letters, :gender_type_id, :ethnicity_type_id, :country_reference_id, :photo, :email, :website, :created_at, :updated_at
json.url person_url(person, format: :json)
