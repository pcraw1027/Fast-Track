class CroupierCore::BarcodeInterface < ApplicationService
<<<<<<< HEAD
  def call(barcode:, source:, asin:, user_id:)
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)
    if bit_rec
      CroupierCore::IncrPitCitProdCount.call!(barcode: barcode)
      success "Barcode already exist."
    else
      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source, 
              asin: asin, user_id: user_id)
      bit_rec.invoke_bit(barcode, source, asin, user_id)
=======
  def call(barcode:, source:, asin:)
    bit = BitRecord.find_by(barcode: barcode, source: source)
    if bit
      CroupierCore::IncrPitCitProdCount.call!(barcode: barcode)
      success "Barcode already exist."
    else
      BitRecord.create!(barcode: barcode, status: 0, source: source, asin: asin)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
      success "Barcode Successfully Added."
    end
  end
end
