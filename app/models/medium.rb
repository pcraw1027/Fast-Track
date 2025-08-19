class Medium < ApplicationRecord
  belongs_to :mediaable, polymorphic: true

  mount_uploader :file, MediaUploader 

  enum media_type: { image: 0, video: 1, file: 2 }

  validates :media_type, presence: true
  validates :file, presence: true

  #default_scope { order(:position) }

  before_destroy :remove_file_from_s3


  after_create :process_in_background


  private

  def process_in_background
    ProcessMediumJob.perform_later(id)
  end


  def remove_file_from_s3
    if file.present?
      file.remove! 
    end
  end

end
