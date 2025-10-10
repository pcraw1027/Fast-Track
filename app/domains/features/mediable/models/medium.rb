module Domains
  module Features
    module Mediable

        class Medium < ApplicationRecord
          self.table_name = "media"
          
          # Associations
          belongs_to :mediaable, polymorphic: true

          mount_uploader :file, Uploaders::MediaUploader 

          enum media_type: { image: 0, video: 1, file: 2 }

          validates :media_type, presence: true
          validates :file, presence: true

          #default_scope { order(:position) }

          after_create :process_in_background
          before_destroy :remove_file_from_s3


          private


          def process_in_background
            Domains::Features::Mediable::ProcessMediumJob.perform_later(id)
          end


          def remove_file_from_s3
            if file.present?
              file.remove! 
            end
          end

        end
      end
    end
  end