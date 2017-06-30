# This migration comes from storytime (originally 20150529192058)
class AddUrlToStorytimeLinks < ActiveRecord::Migration
  def change
    add_column :storytime_links, :url, :string
  end
end
