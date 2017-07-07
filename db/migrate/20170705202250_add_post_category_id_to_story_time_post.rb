class AddPostCategoryIdToStoryTimePost < ActiveRecord::Migration
  def change
    add_reference :storytime_posts, :post_category
    add_index :storytime_posts, :post_category_id
  end
end
