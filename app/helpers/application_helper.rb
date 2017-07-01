module ApplicationHelper

  def render_main_menu
    main_navigation = Storytime::Navigation.find_by(handle: "main")
    menu_html = if main_navigation
      render main_navigation
    else
      Storytime::Page.published.collect do |page|
        content_tag :li do
          link_to page.title, storytime.page_path(page)
        end
      end
    end
    if current_user&.admin?
      menu_html << content_tag(:li) do
        link_to t('defaults.admin'), storytime_admin_path
      end
    end
    menu_html.html_safe
  end

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

  def page_title
    if @page
      case @page.slug
      when 'home'
        storytime_snippet("home_page_title")
      else
        @page&.title
      end
    elsif @post
      @post.title
    end
  end

end
