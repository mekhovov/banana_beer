module ApplicationHelper

  def render_main_menu
    main_navigation = Storytime::Navigation.find_by(handle: "main")
    menu_html = if main_navigation
      render main_navigation
    else
      Storytime::Page.published.collect do |page|
        content_tag :li, class: 'nav-item' do
          link_to page.title, storytime.page_path(page), class: 'nav-link', 'data-scroll': 'true'
        end
      end.join(' ')
    end
    menu_html.html_safe
  end

  def render_admin_menu_item
    if current_user&.admin?
      # TODO: make path in routes for admin page
      link_to t('defaults.admin'), '/storytime', target: '_blank', class: 'nav-link', 'data-scroll': 'true'
    end
  end

  def render_blog_name_and_icon(blog, h = :h6, additional_css_classes = nil)
    return '' if blog.nil?
    content_tag :a, href: "/#{blog.slug}" do
      content_tag h, class: "card-category #{get_blog_css_class(blog)} #{additional_css_classes}" do
        content_tag :i, class: get_blog_icon_css_class(blog) do
          blog.title
        end
      end
    end
  end

  def current_page_slug
    @page&.slug
  end

  def title_css_style
    case current_page_slug
    when 'home'
      "background-image: url('#{image_path('landing_page_bg.jpg')}');"
    else
      return '' unless post_secondary_image_url(@post)
      <<-HTML
      background-size: auto 190px, auto, auto !important;
      background-repeat: repeat, no-repeat, no-repeat;
      background-image: url('#{post_secondary_image_url(@post)}');
      HTML
    end
  end

  def page_filter_class
    case current_page_slug
    when 'home'
      'filter'
    else
      ''
    end
  end

  def hide_title?
    current_page_slug.nil? || %w(blog it travel photo life_and_fun).include?(current_page_slug)
  end

  def parallax_colors
    %w(blue azure green orange red purple)
  end

  def random_bg
    "header-filter parallax parallax-product parallax-#{parallax_colors.sample}"
  end

  def header_page_title_class
    case current_page_slug
    when 'home'
      "page-header-small"
    when 'blog'
      "page-header-very-small ChannelBackground u-blog"
    else
      "page-header-very-small #{random_bg}"
    end
  end

  def get_blog_icon_css_class(blog)
    case blog.slug
    when 'it'
      'fa fa-laptop'
    when 'life_and_fun'
      'fa fa-heart'
    when 'photo'
      'fa fa-camera'
    when 'travel'
      'fa fa-suitcase'
    else
      'fa fa-question'
    end
  end

  def get_blog_css_class(blog)
    case blog.slug
    when 'it'
      'text-info'
    when 'life_and_fun'
      'text-danger'
    when 'photo'
      'text-warning'
    when 'travel'
      'text-success'
    else
      ''
    end
  end

  def page_title
    if @page
      case @page.slug
      when 'home'
        storytime_snippet("home_page_title")
      else
        content_tag :h1 do
          @page&.title
        end
      end
    elsif @post
      content_tag :h1 do
        @post.title
      end
    end
  end

  def home_page?
    @page&.slug == 'home'
  end

  def post_primary_image_url(post)
    post&.featured_media&.file&.url
  end

  def post_secondary_image_url(post)
    post&.secondary_media&.file&.url
  end

  def post_primary_or_default_image_url(post)
    post_primary_image_url(post) || image_url('default_post_image_placeholder.svg')
  end

  def image_dimensions(image)
    if image && image.model&.width && image.model&.height
      "#{image.model.width}x#{image.model.height}"
    elsif image
      "#{image.width}x#{image.height}"
    else
      '600x400'
    end
  end

  def post_image_dimensions(post)
    image_dimensions(post.featured_media&.file)
  end

  def blog_slug
    "/#{Storytime::Blog.find_by(title: 'Blog')&.slug}"
  end

  def take_previous_post(post)
    MyPost.previous_post(post).first
  end

  def take_next_post(post)
    MyPost.next_post(post).last
  end

  def render_logo_link(options)
    title = if @current_storytime_site.title == 'Banana Beer'
      image = image_tag(options.fetch(:image, 'logo.svg'), class: options.fetch(:image_css_class, 'small_logo'))
      "Banana #{image} Beer".html_safe
    else
      @current_storytime_site.title
    end

    link_to root_path, class: options[:link_css_class] do
      title
    end
  end

end
