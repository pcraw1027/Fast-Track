module Domains
  module Users
      class PushNotifyJob < ApplicationJob
        queue_as :notifications

        def perform(product_id)

          begin
            log '[PushNotifyJob] Started'
            log "********************************"
            log "PushNotifyJob"
            log "********************************"
            device_tokens = []
            product = Domains::Products::Product.find(product_id)
            Domains::Users::User.push_enabled
                            .croupier_recommended_frequency
                            .where.not(device_token: nil)
                            .in_batches(of: 1000) do |relation|

                            tokens = relation.pluck(:device_token)

                            device_tokens << tokens
                          end
            device_tokens.each do |tokens|
              FirebasePushService.new.send_bulk(
                device_tokens: tokens,
                title: "Product Updated",
                body: "#{product.name} has been updated",
                data: { product_id: product.id }
              )
            end
          rescue => e
            log "❌ Error processing UpcItemDbLookup: #{e.message}"
            log e.backtrace.take(10).join("\n")
          end
          
          log '[DailyServiceJob] Finished'
        end


        private


        def log(msg)
          puts msg
          Rails.logger.info(msg)
        end

    end
  end
end

