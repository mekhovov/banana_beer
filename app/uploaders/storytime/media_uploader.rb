# encoding: utf-8

module Storytime
  class MediaUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    process :store_dimensions

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :thumb do
      process resize_to_fit: [250, 150]
    end

    version :tiny do
      process resize_to_fit: [50, 50]
    end

    private

      def store_dimensions
        if file && model
          model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
        end
      end

  end
end