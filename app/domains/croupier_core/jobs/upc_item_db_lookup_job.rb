module Domains
  module CroupierCore
      class UpcItemDbLookupJob < ApplicationJob
        queue_as :default

        def perform
          return if already_ran_today?
          begin
            log '[DailyServiceJob] Started'
            log "********************************"
            log "Processing UpcItemDbLookup"
            log "********************************"
            Domains::CroupierCore::UpcItemDbService.call!(count: 100)
          rescue => e
            log "❌ Error processing UpcItemDbLookup: #{e.message}"
            log e.backtrace.take(10).join("\n")
          end
          mark_as_ran!
          log '[DailyServiceJob] Finished'
        end


        private


        def already_ran_today?
          Rails.cache.read('daily_service_last_run') == Date.today
        end

        def mark_as_ran!
          Rails.cache.write('daily_service_last_run', Date.today)
        end

        def log(msg)
          puts msg
          Rails.logger.info(msg)
        end

    end
  end
end