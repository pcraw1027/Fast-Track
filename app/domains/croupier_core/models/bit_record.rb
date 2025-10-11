require 'csv'

module Domains
  module CroupierCore
    class BitRecord < ApplicationRecord
        include BarcodeValidations

        attr_accessor :message

          #enum status: { open: 0, close: 1 }
          belongs_to :user, class_name: "Domains::Users::User"
          default_scope -> { order(updated_at: :desc) }
          self.table_name = "bit_records"

          def status_text
            if status.zero? 
               "Open" 
            else
               "Closed"
            end
          end
          
          def invoke_bit(barcode, source, asin, user_id, brand = "")
            bit_invoke_claims = Domains::CroupierCore::Operations::Bit.call!(barcode: barcode, source: source, asin: asin, 
                                                        user_id: user_id, brand: brand)
            update(status: 1) if bit_invoke_claims.success?
          end

          def self.load_from_file(file, current_user_id)
            result = []
            CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
                barcode = row['Barcode'] || row['barcode']
                next unless barcode

                @brc_intrf_claims = Domains::CroupierCore::Operations::BarcodeInterface.call!(barcode: barcode, 
                                                source: "BIT Load", asin: nil, user_id: current_user_id)
                
                result << @brc_intrf_claims.payload if @brc_intrf_claims&.success?
            end
            result
          end

    end
  end
end
