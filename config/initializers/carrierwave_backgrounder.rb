
CarrierWave::Backgrounder.configure do |config|
  config.backend :delayed_job, queue: :default, job: ProcessAssetWithHook
end