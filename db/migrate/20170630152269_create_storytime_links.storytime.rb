# This migration comes from storytime (originally 20150520185227)
class CreateStorytimeLinks < ActiveRecord::Migration
  def change
    create_table :storytime_links do |t|
      t.string :text
      t.belongs_to :storytime_navigation, index: true, foreign_key: true
      t.references :linkable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
