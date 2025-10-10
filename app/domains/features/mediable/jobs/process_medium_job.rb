module Domains
  module Features
    module Mediable
        class ProcessMediumJob < ApplicationJob
          queue_as :default

          def perform(medium_id)
            medium = Domains::Features::Mediable::Medium.find(medium_id)
            return if medium.file.blank?

            file_path = medium.file.path

            if Rails.env.development?
              unless File.exist?(file_path)
                # Try searching in public/uploads/tmp
                tmp_path = Rails.public_path.join("uploads", "tmp", File.basename(file_path)).to_s
                if File.exist?(tmp_path)
                  file_path = tmp_path
                  # Optionally, re-assign the file
                  medium.file = File.open(file_path)
                else
                  Rails.logger.error "File not found for Medium #{medium_id}: #{file_path} or #{tmp_path}"
                  return
                end
              end
            elsif Rails.env.staging? || Rails.env.production?
              unless File.exist?(file_path)
                # Try to fetch the file from S3 using Fog
                tmp_path = Rails.root.join("tmp", File.basename(file_path)).to_s
                fog_directory = CarrierWave::Uploader::Base.fog_directory
                s3_path = "uploads/tmp/#{File.basename(file_path)}"
                storage = CarrierWave::Storage::Fog.new(CarrierWave::Uploader::Base)
                directory = storage.connection.directories.get(fog_directory)
                file = directory.files.get(s3_path)
                if file
                  File.binwrite(tmp_path, file.body)
                  file_path = tmp_path
                  medium.file = File.open(file_path)
                else
                  Rails.logger.error "File not found for Medium #{medium_id} in S3: #{s3_path}"
                  return
                end
              end
            end

        
            medium.file.cache_stored_file! unless medium.file.cached?
            medium.file.recreate_versions!(:thumb)
            medium.file.process_full!
            medium.save!
            Rails.logger.debug "medium processed!!!!"

          
            tmp_filename = File.basename(file_path)
            tmp_path = Rails.public_path.join('uploads', 'tmp', tmp_filename)
            if Rails.env.staging? || Rails.env.production?
              # Delete from S3 using Fog
              medium.file
              fog_directory = CarrierWave::Uploader::Base.fog_directory
              CarrierWave::Uploader::Base.fog_credentials
              s3_path = "uploads/tmp/#{tmp_filename}"
              # Always use Fog API to delete the specific S3 file by path
              storage = CarrierWave::Storage::Fog.new(CarrierWave::Uploader::Base)
              directory = storage.connection.directories.get(fog_directory)
              file = directory.files.get(s3_path)
              if file
                file.destroy
                Rails.logger.info "Deleted temp file from S3: \\#{s3_path}"
              else
                Rails.logger.warn "Temp file not found in S3 for deletion: \\#{s3_path}"
              end
            elsif File.exist?(tmp_path)
              File.delete(tmp_path)
                Rails.logger.info "Deleted temp file: \\#{tmp_path}"
            end
          end
        end 
    end
  end
end