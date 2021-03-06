# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

   include CarrierWave::RMagick
   #include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
   # process resize_to_fill: [30, 30]
   #def scale(width, height)
     # do something
  # end
  #version :resized do
    # returns an image with a maximum width of 100px 
    # while maintaining the aspect ratio
    # 10000 is used to tell CW that the height is free 
    # and so that it will hit the 100 px width first
  #process resize_to_fill: [140, 140]
 # process convert: 'jpeg'
  #end

version :thumb do
      process resize_to_fill: [60, 60]
end
version :comment do
      process resize_to_fill: [35, 35]
end
#version :profile do
 #     process resize_to_fill: [96,90]
#end
  # Create different versions of your uploaded files:
   #version :thumb do
   #  process :resize_to_fit => [10, 10]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
