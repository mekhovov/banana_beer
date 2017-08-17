# see more: https://github.com/CultivateLabs/storytime/wiki/Admin-of-Rails-Models

class PostCategory < ActiveRecord::Base
  BLOG_CATEGORIES = [:life, :development, :photo, :travel]

  has_many :my_posts

  scope :with_posts, -> { joins(:my_posts).uniq }
  scope :order_by_position, -> { order(:position) }
  scope :blog_categories, -> { where("slug IN (?)", BLOG_CATEGORIES) }
  scope :by_category, ->(category_slug) { find_by(slug: category_slug) }

end
