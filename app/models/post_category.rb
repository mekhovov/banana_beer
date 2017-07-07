# see more: https://github.com/CultivateLabs/storytime/wiki/Admin-of-Rails-Models

class PostCategory < ActiveRecord::Base
  has_many :my_posts

  scope :with_posts, -> { PostCategory.joins(:my_posts).uniq }
end
