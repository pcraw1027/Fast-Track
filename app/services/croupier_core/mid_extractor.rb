class CroupierCore::MidExtractor < ApplicationService
  STRATEGIES = {
    12 => ->(barcode) { barcode[1..5] },
    13 => ->(barcode) { barcode[2..6] }
  }.freeze

  def call(barcode:)
    extractor = STRATEGIES[barcode.length]

    if extractor
      success extractor.call(barcode)
    else
      failure "Unsupported barcode format"
    end
  end
end
