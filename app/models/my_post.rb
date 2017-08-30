# see more: https://github.com/CultivateLabs/storytime/wiki/Using-Custom-Post-Types

class MyPost < Storytime::BlogPost
  BLOG_TYPES_FOR_MY_BLOG_PAGE = [:it, :travel, :photo, :life_and_fun]

  belongs_to :post_category
  validates :post_category_id, presence: true

  scope :previous_post, -> (current_post) { published.order(published_at: :desc).where('id < ?', current_post.id) }
  scope :next_post,    -> (current_post) { published.order(published_at: :desc).where('id > ?', current_post.id) }
  scope :by_category,  -> (category) { joins(:post_category).where(post_category: category) }
  scope :by_blogs,  ->(blogs){ where(blog: blogs) }
  scope :order_by_updated,  -> { order(updated_at: :desc) }

  def self.blogs_for_my_blog_page
    Storytime::Blog.where(slug: BLOG_TYPES_FOR_MY_BLOG_PAGE).all
  end

end
