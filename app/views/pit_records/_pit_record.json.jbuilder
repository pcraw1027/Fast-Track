json.extract! pit_record, :id, :product_activity_count, :barcode, :level, :source, :product_id, :mid, :created_at, 
:updated_at
json.url pit_record_url(pit_record, format: :json)
