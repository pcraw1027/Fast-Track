require 'elasticsearch'

Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: Rails.application.credentials.elasticsearch_host,
  user: Rails.application.credentials.elasticsearch_username,
  password: Rails.application.credentials.elasticsearch_password,
  ssl: true,
  transport_options: {
    ssl: { verify: false } 
  },
  log: true
)
