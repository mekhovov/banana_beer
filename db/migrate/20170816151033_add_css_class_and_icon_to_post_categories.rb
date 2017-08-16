class AddCssClassAndIconToPostCategories < ActiveRecord::Migration
  def up
    add_column :post_categories, :position, :integer unless column_exists?(:post_categories, :position)
    add_column :post_categories, :category_css_class, :string unless column_exists?(:post_categories, :category_css_class)
    add_column :post_categories, :icon_css_class, :string unless column_exists?(:post_categories, :icon_css_class)
  end

  def down
    remove_column :post_categories, :position if column_exists?(:post_categories, :position)
    remove_column :post_categories, :category_css_class if column_exists?(:post_categories, :category_css_class)
    remove_column :post_categories, :icon_css_class if column_exists?(:post_categories, :icon_css_class)
  end
end
