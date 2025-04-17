class CroupierCore::UploadTrigger < ApplicationService
  def call(barcode:, scan_id:, user_id:, asin:, upload_params:)
    source = "Upload"
<<<<<<< HEAD
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)

    unless bit_rec
      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source, 
                        asin: asin, user_id: user_id) 
      bit_rec.invoke_bit(barcode, source, asin, user_id, upload_params[:brand])
    end

=======
    bit = BitRecord.find_by(barcode: barcode, source: source)
    BitRecord.create!(barcode: barcode, status: 0, source: source, asin: asin) unless bit
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
    upload = UploadRecord.create!(product_name: upload_params[:product_name], 
                        company_name: upload_params[:company_name], 
                        remarks: upload_params[:remarks], image: upload_params[:image],
                        barcode: barcode, date: Date.today, 
                        scan_id: scan_id, user_id: user_id, resolve_status: false)
    success upload
  end
end

