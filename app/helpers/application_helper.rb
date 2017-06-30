module ApplicationHelper

  def recent_posts
    Storytime::BlogPost.published.order(published_at: :desc).limit(3)
  end

  def header_colour
    # available colors: blue, azure, green, orange, red, purple, gray
    case @page&.slug
    when 'home'
      :green
    when 'blog'
      :red
    else
      :orange
    end
  end

end
