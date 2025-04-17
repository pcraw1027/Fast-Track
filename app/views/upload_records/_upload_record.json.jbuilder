json.extract! upload_record, :id, :scan_id, :user_id, :resolve_status, :date, :barcode, :product_name, :company_name, :remarks, :image, :created_at, :updated_at
json.url upload_record_url(upload_record, format: :json)
