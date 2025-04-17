json.extract! scan, :id, :product_id, :user_id, :scan_date, :barcode, :product_exists, :created_at, :updated_at
json.url scan_url(scan, format: :json)
