json.extract! company, :id, :name, :logo, :industry_category_type_id, :address_1, :address_2, :city, :state, :country, :established, :website, :diversity_report, :diversity_score, :total_employees, :created_at, :updated_at
json.url company_url(company, format: :json)
