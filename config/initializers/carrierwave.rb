CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_credentials = {
        provider: "AWS",
        aws_access_key_id: Rails.application.credentials.aws_access_key_id,
        aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
        region: Rails.application.credentials.s3_region
    }
    config.fog_directory = Rails.application.credentials.s3_bucket_name
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
  # config.s3_access_policy = :public_read
end
