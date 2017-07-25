class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

	if Rails.env.production?
	    storage :fog
	  else
	    storage :file
	  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :small do
    process resize_to_fit: [100, 100]
  end

  version :medium do
    process resize_to_fit: [150, 150]
  end

  version :large do
    process resize_to_fit: [250, 250]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
