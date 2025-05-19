class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[
      jpg jpeg png gif svg
      pdf
      mp4 mov mpeg
      doc docx
      xls xlsx
      ppt pptx
      rtf txt
    ]
  end

  def content_type_allowlist
    [
      /image\//,
      /video\//,
      'video/mpeg',
      'application/pdf',
      'image/svg+xml',
      'text/plain',
      'application/msword',
      'application/vnd.ms-excel',
      'application/vnd.ms-powerpoint',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'application/rtf',
      'application/octet-stream'
    ]
  end

  def image?(new_file)
    new_file.content_type.start_with?('image')
  end

  process resize_to_fit: [180, 180], if: :image?

  version :thumb, if: :image? do
    process resize_to_fill: [58, 58]
  end


  # version :large, if: :image? do
  #   process resize_to_limit: [800, 800]
  # end
end
