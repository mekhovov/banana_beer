class AddDescriptionToPostCategories < ActiveRecord::Migration
  def up
    add_column :post_categories, :description, :text unless column_exists?(:post_categories, :description)
  end

  def down
    remove_column :post_categories, :description if column_exists?(:post_categories, :description)
  end
end
