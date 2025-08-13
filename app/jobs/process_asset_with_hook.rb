class ProcessAssetWithHook < Struct.new(:record_id, :file)
  def perform
    record = Medium.find(record_id)
    record.send(file).recreate_versions!
    Rails.logger.info "Custom hook: #{column} processed for Medium ##{record.id}"
  end
end
