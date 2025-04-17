json.extract! company_contact, :id, :company_id, :company_contact_type_id, :name, :job_title, :email, :phone, :photo, :created_at, :updated_at
json.url company_contact_url(company_contact, format: :json)
