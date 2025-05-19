class CroupierCore::UploadTrigger < ApplicationService
  def call(barcode:, scan_id:, user_id:, asin:, brand:, upload_params:)
    source = "Upload"
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)
    
    unless bit_rec
      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source, 
                        asin: asin, user_id: user_id) 
      bit_rec.invoke_bit(barcode, source, asin, user_id, brand)
    end
    p upload_params
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    upload = UploadRecord.new(upload_params)
    upload.barcode = barcode 
    upload.date = Date.today 
    upload.scan_id = scan_id
    upload.user_id = user_id
    upload.resolve_status = false
    upload.save!

    success upload
  end
end

