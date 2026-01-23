require 'net/http'

module Domains
  module CroupierCore
    class UpcItemDbService < ApplicationService

          def call(count:)

            pit_recs = Domains::CroupierCore::PitRecord.for_lookup(count)

            pit_recs.each_with_index do |pit, index|
                begin
                    Domains::CroupierCore::LookupUtils.resolve_records(
                        pit: pit
                    )

                rescue Faraday::TooManyRequestsError, Net::HTTPTooManyRequests => e
                    Rails.logger.warn "UPCitemDB rate limited. Waiting before retry..."

                    sleep 30
                    retry

                rescue StandardError => e
                    Rails.logger.error "Lookup failed for PitRecord #{pit.id}: #{e.message}"
                end

                unless index == pit_recs.size - 1
                    sleep 15 # 4 requests/minute safety
                end
            end
          end         
          
    end
  end
end



