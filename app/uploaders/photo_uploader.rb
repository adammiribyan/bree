# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file

  def store_dir
    "images/photos"
  end

  version :thumb do
    process :resize_to_fill => [65, 65]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
