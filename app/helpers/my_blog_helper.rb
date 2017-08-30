module MyBlogHelper

  def blogs_for_my_blog_page
    Storytime::Blog.where(slug: MyPost::BLOG_TYPES_FOR_MY_BLOG_PAGE)
  end

end