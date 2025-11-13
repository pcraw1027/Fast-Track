require "open-uri"
require "mini_mime"
require "fileutils"
require "aws-sdk-s3"
require "mini_magick"

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
          return log("❌ Medium #{medium_id} not found") unless medium
          return log("❌ Medium #{medium_id} has no attached file") if medium.file.blank?

          if Rails.env.production? || Rails.env.staging?
            process_remote_file(medium)
          else
            process_local_file(medium)
          end

          log "✅ Finished processing Medium ##{medium_id}"
        rescue => e
          log "❌ Error processing Medium #{medium_id}: #{e.message}"
          log e.backtrace.take(10).join("\n")
        end



        private



        def process_remote_file(medium)
          remote_url = medium.file.url
          thumb_url = medium.file.thumb.url
          log "🌐 Remote file URL: #{remote_url}"

          s3 = Aws::S3::Resource.new( aws_access_key_id: Rails.application.credentials.aws_access_key_id,
                                      aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
                                      region: Rails.application.credentials.s3_region)
          bucket_name = Rails.application.credentials.s3_bucket_name
          bucket = s3.bucket(bucket_name)

          temp_dir = Rails.root.join("tmp", "media_processing", medium.id.to_s)
          FileUtils.mkdir_p(temp_dir)

          # ------------------------------
          # STEP 1️⃣ — Download from S3
          # ------------------------------
          original_filename = File.basename(URI.parse(remote_url).path)
          sanitized_filename = original_filename.gsub(/[^\w.\-]/, "_")
          local_input_path = File.join(temp_dir, sanitized_filename)

          URI.open(remote_url, "rb") do |remote_file|
            File.open(local_input_path, "wb") { |f| IO.copy_stream(remote_file, f) }
          end
          log "✅ Downloaded to: #{local_input_path}"

          # ------------------------------
          # STEP 2️⃣ — Remove Background
          # ------------------------------
          output_filename = "processed_#{sanitized_filename}"
          output_path = File.join(temp_dir, output_filename)

          begin
            image = MiniMagick::Image.open(local_input_path)
            image.format "png"
            image.alpha('on')
            image.combine_options do |c|
              c.fuzz "5%"
              c.transparent '#F7F7F7'
            end
            image.resize("522x522")
            image.write(output_path)
            log "🎨 Background removed and saved to: #{output_path}"
          rescue => e
            raise "MiniMagick background removal failed: #{e.message}"
          end

          # ------------------------------
          # STEP 3️⃣ — Delete old S3 file
          # ------------------------------
          begin
            s3_key = URI.parse(remote_url).path.sub(%r{^/}, "")
            bucket.object(s3_key).delete
            log "🗑️ Deleted old S3 file: #{s3_key}"
          rescue => e
            log "⚠️ Could not delete old file: #{e.message}"
          end

          # ------------------------------
          # STEP 4️⃣ — Assign and re-upload
          # ------------------------------
          begin
            content_type = MiniMime.lookup_by_filename(output_path)&.content_type || "image/png"

            uploaded_file = CarrierWave::SanitizedFile.new(
              file: File.open(output_path, "rb"),
              filename: output_filename,
              content_type: content_type
            )

            uploader = Uploaders::MediaUploader.new(medium, :file)
            uploader.cache!(uploaded_file)
            uploader.store!

            # assign new uploader to the model
            medium.file = uploader
            medium.skip_process_in_background = true
            medium.save!
            log "☁️  Uploaded processed image and updated Medium ##{medium.id}"
          rescue => e
            raise "Failed to reassign processed file: #{e.message}"
          end

        rescue => e
          log "❌ Failed to process remote file: #{e.message}"
          log e.backtrace.take(10).join("\n")
          raise e
        ensure
          if Dir.exist?(temp_dir)
            FileUtils.remove_entry_secure(temp_dir)
            log "🧹 Cleaned up temporary files at: #{temp_dir}"
          end
        end

        # ------------------------------
        # LOCAL DEV FALLBACK
        # ------------------------------
        def process_local_file(medium)
          file_path = medium.file.path
          return log("❌ File not found locally: #{file_path}") unless File.exist?(file_path)

          log "📂 Using local file: #{file_path}"
          output_path = file_path.sub(/(\.\w+)$/, "_processed\\1")

          image = MiniMagick::Image.open(file_path)
          image.alpha('on')
          image.format "png"
          image.combine_options do |c|
            c.fuzz "5%"
            c.transparent '#F7F7F7'
          end
          image.resize("522x522")

          image.write(output_path)
          log "🎨 Background removed locally and saved to #{output_path}"

          medium.file = File.open(output_path)
          medium.skip_process_in_background = true
          medium.save!
          log "✅ Medium saved with processed local file"
        end

        # ------------------------------
        # LOGGING
        # ------------------------------
        def log(msg)
          puts msg
          Rails.logger.info(msg)
        end
      end
    end
  end
end
