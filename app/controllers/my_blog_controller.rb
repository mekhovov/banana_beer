class MyBlogController < Storytime::BlogsController
  layout :set_layout

  def index
    @posts = Storytime.search_adapter.search(params[:search], get_search_type) if (params[:search] && params[:search].length > 0)
    @posts = @posts.tagged_with(params[:tag]) if params[:tag]
    @posts = @posts.published.order(published_at: :desc).page(params[:page_number])

    render "storytime/blogs/show"
  end

  private

    def load_page
      @posts = MyPost.by_blogs(MyPost::blogs_for_my_blog_page)
    end

end
