class LogoUploader < CarrierWave::Uploader::Base
  # Include RMagick, MiniMagick, or Vips support:
  # include CarrierWave::RMagick
    include CarrierWave::MiniMagick
  # include CarrierWave::Vips

  # Choose what kind of storage to use for this uploader:
  #storage :file
   #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
   #  process resize_to_fit: [144,144]
     #process scale: [200, 300]
  #
  #  def scale(width, height)
  #    # do something
  #  end


  process :resize_and_make_background_transparent => ['144x144']
  

  # Create different versions of your uploaded files:
    version :thumb do
      process :resize_and_make_background_transparent => ['58x58']
    end


    def resize_and_make_background_transparent(size)
    manipulate! do |img|
      img.format('png')
      img.alpha('on') 

      img.combine_options do |c|
        c.fuzz '5%'  
        c.transparent 'white'
      end

      img.resize(size)
      img
    end
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  def remove_previously_stored_files_after_update
    true
  end

  def mini_magick
    MiniMagick
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg"
  # end
end
