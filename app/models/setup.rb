class Setup < ActiveRecord::Base

  # TODO: move to setup table
  def self.site_settings
    @site_settings ||= Hash.new
    @site_settings = {
      home: {
        hide_title: false,
        section_class: 'section-gray',
        header_page_title_class: 'page-header-small'
      },
      recent_posts: {
        hide_title: false,
        section_class: 'section-gray'
      },
      blog: {
        hide_title: true,
        section_class: 'section-white'
      },
      post: {
        hide_title: true,
        section_class: 'section-gray'
      },
      it: {
        hide_title: true,
        section_class: 'section-white',
        blog_icon_css_class: 'fa fa-laptop',
        blog_css_class: 'text-info',
        show_on_blog_page: true,
        show_on_recent_posts_page: true
      },
      photo: {
        hide_title: true,
        section_class: 'section-dark',
        nav_bg: 'bg-dark',
        blog_icon_css_class: 'fa fa-camera',
        blog_css_class: 'text-warning',
        show_on_blog_page: true,
        show_on_recent_posts_page: false
      },
      travel: {
        hide_title: true,
        section_class: 'section-white',
        blog_icon_css_class: 'fa fa-suitcase',
        blog_css_class: 'text-success',
        show_on_blog_page: true,
        show_on_recent_posts_page: true
      },
      life_and_fun: {
        hide_title: true,
        section_class: 'section-white',
        blog_icon_css_class: 'fa fa-heart',
        blog_css_class: 'text-danger',
        show_on_blog_page: true,
        show_on_recent_posts_page: true
      }
    }
    @site_settings.default = {
      hide_title: false,
      section_class: 'section-white',
      header_page_title_class: 'page-header-very-small header-filter parallax parallax-product parallax-#{parallax_colors.sample}',
      blog_icon_css_class: 'fa fa-question',
      blog_css_class: '',
      show_on_blog_page: false,
      show_on_recent_posts_page: false
    }
    @site_settings
  end

  def self.blog_slugs_for_my_blog_page
    Setup.site_settings.select{ |key, val| val[:show_on_blog_page] }.keys
  end

  def self.get_blogs_for_my_blog_page
    Storytime::Blog.where(slug: Setup.blog_slugs_for_my_blog_page)
  end

  def self.get_posts_for_my_blog_page
    MyPost.by_blogs(get_blogs_for_my_blog_page)
  end

  def self.get_posts_for_recent_posts_section
    blogs_slugs = Setup.site_settings.select{ |key, val| val[:show_on_recent_posts_page] }.keys
    blogs = Storytime::Blog.where(slug: blogs_slugs)
    MyPost.published.by_blogs(blogs).order_by_updated.limit(3)
  end

  def self.get_posts_for_recent_photos_section
    blogs = Storytime::Blog.where(slug: :photo)
    MyPost.published.by_blogs(blogs).order_by_updated.limit(4)
  end

end