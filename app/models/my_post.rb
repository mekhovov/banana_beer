# see more: https://github.com/CultivateLabs/storytime/wiki/Using-Custom-Post-Types

class MyPost < Storytime::BlogPost
  belongs_to :post_category
  validates :post_category_id, presence: true

  def category_name
    post_category.name
  end

end
