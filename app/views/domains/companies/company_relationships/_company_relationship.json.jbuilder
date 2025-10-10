json.extract! company_relationship, :id, :company_relationship_type_id, :parent_company_id, :child_company_id, 
:created_at, :updated_at
json.url company_relationship_url(company_relationship, format: :json)
