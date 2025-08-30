json.extract! product_attribute, :id, :company_id, :product_id, :brick_id, :attribute_title_id, :attribute_value_id, 
:product_category_source_id, :created_at, :updated_at
json.url product_attribute_url(product_attribute, format: :json)
