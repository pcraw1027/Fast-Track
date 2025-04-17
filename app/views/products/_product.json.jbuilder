json.extract! product, :id, :company_id, :name, :description, :barcode, :qrcode, :size, :segment_id, :family_id, :klass_id, :brick_id, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
