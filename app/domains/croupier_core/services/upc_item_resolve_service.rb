module Domains
  module CroupierCore
    class UpcItemResolveService < ApplicationService

          def call(product_data_attributes:)
            barcodes = product_data_attributes.map{|pd| pd[:barcode]}
  
            pit_recs = Domains::CroupierCore::PitRecord.where(barcode: barcodes)

            pit_hash = pit_recs.group_by(&:barcode)

            product_data_attributes.each do |product_data|
                Domains::CroupierCore::LookupUtils.resolve_records(
                    pit: pit_hash[product_data[:barcode]]&.first, 
                    product_data: product_data, 
                    to_resolve: true
                )
            end
          end
          
    end
  end
end



