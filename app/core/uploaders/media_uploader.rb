require 'mini_magick'
class Uploaders::MediaUploader < CarrierWave::Uploader::Base
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
      %r{image/},
      %r{video/},
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

  def remove_previously_stored_files_after_update
    true
  end

  def image?(new_file)
    if new_file.content_type
      new_file.content_type.start_with?('image')
    else
      false
    end
  end


  def restore_versions!
    versions.each_value(&:store!)
  end

  version :thumb do
     process resize_to_fit: [180, 180]
  end

  def mini_magick
    MiniMagick
  end


end


  

