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
          log "🌐 Remote file URL: #{remote_url}"

          s3 = Aws::S3::Resource.new(
            access_key_id: Rails.application.credentials.aws_access_key_id,
            secret_access_key: Rails.application.credentials.aws_secret_access_key,
            region: Rails.application.credentials.s3_region
          )
          bucket = s3.bucket(Rails.application.credentials.s3_bucket_name)

          temp_dir = Rails.root.join("tmp", "media_processing", medium.id.to_s)
          FileUtils.mkdir_p(temp_dir)

          original_filename = File.basename(URI.parse(remote_url).path)
          sanitized_filename = original_filename.gsub(/[^\w.\-]/, "_")
          local_input_path = File.join(temp_dir, sanitized_filename)

          # 1️⃣ Download original file
          URI.open(remote_url, "rb") do |remote_file|
            File.open(local_input_path, "wb") { |f| IO.copy_stream(remote_file, f) }
          end
          log "✅ Downloaded to: #{local_input_path}"

          output_filename = "processed_#{sanitized_filename}"
          output_path = File.join(temp_dir, output_filename)

          thumb_output_filename = "thumb_#{sanitized_filename}"
          thumb_output_path = File.join(temp_dir, thumb_output_filename)
          begin
            process_and_write_image(local_input_path, output_path, "522x522")
            process_and_write_image(local_input_path, thumb_output_path, "180x180")
            log "🎨 Processed main + thumbnail"
          rescue => e
            raise "MiniMagick error: #{e.message}"
          end

          # 4️⃣ Delete old file from S3
          begin
            s3_key = URI.parse(remote_url).path.sub(%r{^/}, "")
            bucket.object(s3_key).delete
            log "🗑️ Deleted old S3 file: #{s3_key}"
          rescue => e
            log "⚠️ Could not delete old file: #{e.message}"
          end

          # 5️⃣ Reassign processed file to medium
          begin
            medium.file = File.open(output_path)
            medium.skip_process_in_background = true
            medium.save!
            log "📤 Uploaded new main image"
          rescue => e
            raise "Failed to save processed file: #{e.message}"
          end

          begin
            # TransferManager requires the low-level client
            client = s3.client

            # Create a TransferManager
            manager = Aws::S3::TransferManager.new(client: client)

            uploader = medium.file
            thumb_key = uploader.thumb.path.gsub(%r{^/}, "")


            handle = manager.upload_file(
              thumb_output_path,
              bucket: Rails.application.credentials.s3_bucket_name,
              key: thumb_key
            )



            log "📤 Uploaded thumbnail to S3"
          rescue => e
            log "⚠️ Failed to upload thumbnail: #{e.message}"
          end

        ensure
          if Dir.exist?(temp_dir)
            FileUtils.remove_entry_secure(temp_dir)
            log "🧹 Cleaned up temporary directory"
          end
        end

        def process_local_file(medium)
          file_path = medium.file.path
          return log("❌ File not found locally: #{file_path}") unless File.exist?(file_path)

          log "📂 Using local file: #{file_path}"

          output_path = file_path.sub(/(\.\w+)$/, "_processed.png")
          thumb_output_path = file_path.sub(/(\.\w+)$/, "_processed_thumb.png")
          process_and_write_image(file_path, output_path, "522x522")
          log "🎨 Local processing complete: #{output_path}"
          process_and_write_image(file_path, thumb_output_path, "180x180")
          log "🎨 Local thumbnail complete: #{thumb_output_path}"

          medium.file = File.open(output_path)
          medium.skip_process_in_background = true
          medium.save!

          log "💾 Medium saved with processed main image"

          #
          # 4️⃣ Store thumbnail to CarrierWave expected path
          #
          begin
            uploader = medium.file

            # Absolute path to thumbnail
            thumb_fs_path = File.join(uploader.root, uploader.thumb.store_path)

            FileUtils.mkdir_p(File.dirname(thumb_fs_path))
            FileUtils.cp(thumb_output_path, thumb_fs_path)

            log "🖼️ Local thumbnail stored at: #{thumb_fs_path}"



            log "🖼️ Local thumbnail stored at: #{thumb_path}"
          rescue => e
            log "⚠️ Failed to write local thumbnail: #{e.message}"
          end
        end


        def process_and_write_image(in_path, output_path, size)
          image = MiniMagick::Image.open(in_path) # ← RE-OPEN IMAGE
          image.format "png"
          image.combine_options do |c|
            c.fuzz "5%"
            c.transparent "#F7F7F7"
          end
          image.auto_orient
          image.resize(size)
          image.write(output_path)
        end


        def log(msg)
          puts msg
          Rails.logger.info(msg)
        end
      end
    end
  end
end