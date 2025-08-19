class ProcessMediumJob < ApplicationJob
  queue_as :default

  def perform(medium_id)
    medium = Medium.find(medium_id)

    return unless medium.file.present?

    # Recreate versions and apply processing
    medium.file.cache_stored_file! unless medium.file.cached?
    medium.file.recreate_versions!(:thumb)
    medium.file.process_full!
    medium.save!
    puts "medium processed!!!!"
  end
end
