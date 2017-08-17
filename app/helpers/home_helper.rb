module HomeHelper

  def recent_posts
    MyPost.published.order_by_updated.limit(3)
  end

end