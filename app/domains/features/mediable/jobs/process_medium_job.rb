require "open-uri"
require "mini_mime"

module Domains
  module Features
    module Mediable
      class ProcessMediumJob < ApplicationJob
        queue_as :default

        def perform(medium_id)
          log "********************************"
          log "Processing Medium ##{medium_id}"
          log "********************************"

          medium = Domains::Features::Mediable::Medium.find_by(id: medium_id)
          unless medium
            log "❌ Medium #{medium_id} not found"
            return
          end

          if medium.file.blank?
            log "❌ Medium #{medium_id} has no attached file"
            return
          end

          if Rails.env.production? || Rails.env.staging?
            process_remote_file(medium)
          else
            process_local_file(medium)
          end

          log "✅ Medium processed successfully!"
        rescue => e
          log "❌ Error processing Medium #{medium_id}: #{e.message}"
          log e.backtrace.take(5).join("\n")
        end

        private

        # ✅ Production/staging: Use remote S3 file directly
        def process_remote_file(medium)
            remote_url = medium.file.url
            log "📦 Loading remote file directly from S3: #{remote_url}"

            file_io = URI.open(remote_url)
            filename = File.basename(URI.parse(remote_url).path)
            content_type = MiniMime.lookup_by_filename(filename)&.content_type || "application/octet-stream"

            # ✅ Ensure CarrierWave cache directory exists
            cache_path = CarrierWave::Uploader::Base.new.cache_dir
            FileUtils.mkdir_p(cache_path) unless Dir.exist?(cache_path)

            uploaded_file = CarrierWave::SanitizedFile.new(
              tempfile: file_io,
              filename: filename,
              content_type: content_type
            )

            medium.file = uploaded_file
            medium.file.cache!
            log "✅ File loaded and cached in CarrierWave: #{filename}"

            medium.file.recreate_versions!(:thumb)
            medium.file.process_full! if medium.file.respond_to?(:process_full!)
            medium.save!
          rescue => e
            log "❌ Failed to process remote file: #{e.message}"
            raise
          end


        # 🧰 Development: use local filesystem version
        def process_local_file(medium)
          file_path = medium.file.path
          log "File path: #{file_path}"

          unless File.exist?(file_path)
            log "❌ File not found locally: #{file_path}"
            return
          end

          uploaded_file = CarrierWave::SanitizedFile.new(
            tempfile: File.open(file_path),
            filename: File.basename(file_path),
            content_type: MiniMime.lookup_by_filename(file_path)&.content_type
          )

          medium.file = uploaded_file
          medium.file.cache_stored_file!
          log "✅ File cached locally: #{medium.file.cache_name}"

          medium.file.recreate_versions!(:thumb)
          medium.file.process_full! if medium.file.respond_to?(:process_full!)
          medium.save!
        end

        def log(msg)
          puts msg
          Rails.logger.info(msg)
        end
      end
    end
  end
end

