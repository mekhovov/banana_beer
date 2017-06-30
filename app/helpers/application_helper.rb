module ApplicationHelper

  def recent_posts
    Storytime::BlogPost.published.order(published_at: :desc).limit(3)
  end

end
