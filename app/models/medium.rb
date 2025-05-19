class Medium < ApplicationRecord
  belongs_to :mediaable, polymorphic: true

  mount_uploader :file, MediaUploader 

  enum media_type: { image: 0, video: 1, file: 2 }

  validates :media_type, presence: true
  validates :file, presence: true

  default_scope { order(:position) }

end
