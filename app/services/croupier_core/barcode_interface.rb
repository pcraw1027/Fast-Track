class CroupierCore::BarcodeInterface < ApplicationService
  def call(barcode:, source:, asin:, user_id:)
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)
    if bit_rec
      CroupierCore::IncrPitCitProdCount.call!(barcode: barcode)
      success "Barcode already exist."
    else
      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source, 
              asin: asin, user_id: user_id)
      bit_rec.invoke_bit(barcode, source, asin, user_id)
      success "Barcode Successfully Added."
    end
  end
end
