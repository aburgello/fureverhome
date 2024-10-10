# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    "default_image.png"
  end

  # Process files as they are uploaded:
  process resize_to_fit: [800, 800]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
