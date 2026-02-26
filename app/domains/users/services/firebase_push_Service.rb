require 'net/http'

module Domains
  module CroupierCore
    class FirebasePushService
        FIREBASE_SCOPE = "https://www.googleapis.com/auth/firebase.messaging"

        def initialize
            firebase_config = Rails.application.credentials.dig(:firebase, :credentials)
            @credentials = Google::Auth::ServiceAccountCredentials.make_creds(
            json_key_io: StringIO.new(firebase_config.to_json),
            scope: FIREBASE_SCOPE
            )
            @credentials.fetch_access_token!
        end

        def send_bulk(device_tokens:, title:, body:, data: {})
            device_tokens.each_slice(500) do |batch|
            batch.each do |token|
                send_message(token, title: title, body: body, data: data)
            end
            end
        end


        private
        

        def send_message(token, title:, body:, data:)
            connection.post do |req|
            req.url firebase_url
            req.headers["Authorization"] = "Bearer #{@credentials.access_token}"
            req.headers["Content-Type"] = "application/json"

            req.body = {
                message: {
                token: token,
                notification: {
                    title: title,
                    body: body
                },
                data: data.transform_values(&:to_s)
                }
            }.to_json
            end
        end

        def firebase_url
            "https://fcm.googleapis.com/v1/projects/#{firebase_project_id}/messages:send"
        end

        def firebase_project_id
            Rails.application.credentials.firebase_project_id
        end

        def connection
            @connection ||= Faraday.new
        end
        end
  end
end
