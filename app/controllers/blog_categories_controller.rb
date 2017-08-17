class BlogCategoriesController < Storytime::BlogsController
  # Override Storytime::BlogsController for categories filter
  before_action :load_page, :prepare_post
  before_action :load_posts_by_category, only: PostCategory::BLOG_CATEGORIES

  def development
    # render development posts
  end

  def photo
    # render photo posts
  end

  def life
    # render life posts
  end

  def travel
    # render travel posts
  end

private

  def load_posts_by_category
    @posts = @posts.where('post_category_id = ?', PostCategory.by_category(params[:action]).id)
  end

  def load_page
    # TODO: fix: find blog, not just get first
    @page = @current_storytime_site.blogs.first
  end

  def prepare_post
    if params[:preview].nil? && params[:id].present? && params[:id] != @page.slug
      return redirect_to @page, :status => :moved_permanently
    end

    @posts = @page.posts
    @posts = Storytime.search_adapter.search(params[:search], get_search_type) if (params[:search] && params[:search].length > 0)
    @posts = @posts.tagged_with(params[:tag]) if params[:tag]
    @posts = @posts.where('post_category_id = ?', PostCategory.by_category(params[:category]).id) if params[:category]
    @posts = @posts.published.order(published_at: :desc).page(params[:page_number])
  end

end
