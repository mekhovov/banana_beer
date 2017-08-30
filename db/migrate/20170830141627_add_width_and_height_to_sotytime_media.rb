class AddWidthAndHeightToSotytimeMedia < ActiveRecord::Migration
  def change
    add_column :storytime_media, :width, :integer
    add_column :storytime_media, :height, :integer
  end
end
