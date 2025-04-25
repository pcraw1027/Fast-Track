class CroupierCore::BarcodeInterface < ApplicationService
  def call(barcode:, source:, asin:, user_id:)
    bit_rec = BitRecord.find_by(barcode: barcode, source: source)
    if bit_rec
      CroupierCore::IncrPitCitProdCount.call!(barcode: barcode)
      success({:bit_rec => bit_rec, :message => "Barcode Exists"})
    else
      bit_rec = BitRecord.create!(barcode: barcode, status: 0, source: source, 
              asin: asin, user_id: user_id)
      bit_rec.invoke_bit(barcode, source, asin, user_id)
      success({:bit_rec => bit_rec, :message => "Barcode Added"})
    end
  end
end

