json.extract! bit_record, :id, :barcode, :status, :source, :created_at, :updated_at
json.url bit_record_url(bit_record, format: :json)
