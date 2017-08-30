class ApplyWidthAndHeightToExistingSotytimeMedia < ActiveRecord::Migration
  def up
    Storytime::Media.all.each do |media|
      if media.file
        media.width, media.height = ::MiniMagick::Image.open(media.file.url)[:dimensions]
        media.save
      end
    end
  end
end
