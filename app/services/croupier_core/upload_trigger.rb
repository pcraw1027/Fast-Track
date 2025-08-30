class CroupierCore::UploadTrigger < ApplicationService

  def call(barcode:, scan_id:, user_id:, asin:, brand:, upload_params:, symbology: nil)
    source = "Upload"
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)
    
    unless bit_rec
      barcode_symbology = CroupierCore::BarcodeInterface::SUPPORTED_SYMBOLOGIES[symbology] || "Unknown"

      if barcode_symbology == "Unknown"
        barcode_symbology = CroupierCore::BarcodeInterface::SUPPORTED_SYMBOLOGIES_BY_BARCODE_LENGTH[barcode.length] || "Unknown"
      end

      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source,
                        asin: asin, user_id: user_id, symbology: barcode_symbology)
      bit_rec.invoke_bit(barcode, source, asin, user_id, brand)
    end

    upload = UploadRecord.new(upload_params)
    upload.barcode = barcode 
    upload.date = Time.zone.today 
    upload.scan_id = scan_id
    upload.user_id = user_id
    upload.resolve_status = false
    upload.save!

    success upload
  end
end

