require 'mini_magick'
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

  process :resize_and_make_background_transparent => ['522x522'], if: :image?

  version :thumb, if: :image? do
    process :resize_and_make_background_transparent => ['180x180']
  end

  def resize_and_make_background_transparent(size)
    manipulate! do |img|
      img.format('png')
      img.alpha('on') 

      img.combine_options do |c|
        c.fuzz '5%'  
        c.transparent '#F7F7F7'
      end

      img.resize(size)
      img
    end
  end


  def mini_magick
    MiniMagick
  end

end


  

