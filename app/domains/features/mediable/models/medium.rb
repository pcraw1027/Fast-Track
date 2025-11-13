module Domains
  module Features
    module Mediable
        class Medium < ApplicationRecord
          self.table_name = "media"
          attr_accessor :skip_process_in_background
          
          # Associations
          belongs_to :mediaable, polymorphic: true

          mount_uploader :file, Uploaders::MediaUploader 

          enum media_type: { image: 0, video: 1, file: 2 }

          validates :media_type, presence: true
          validates :file, presence: true

          #default_scope { order(:position) }

          after_save :process_in_background, unless: :skip_process_in_background
          before_destroy :remove_file_from_s3


          private


          def process_in_background
            Domains::Features::Mediable::ProcessMediumJob.perform_later(id)
          end


          def remove_file_from_s3
            return if file.blank?

              file.remove! 
            
          end

        end
    end
  end
end