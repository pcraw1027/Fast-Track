json.extract! cit_record, :id, :product_activity_count, :mid, :company_name, :level, :product_orphan_count, :source, 
:company_id, :created_at, :updated_at
json.url cit_record_url(cit_record, format: :json)
