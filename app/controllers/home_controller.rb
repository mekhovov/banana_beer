class HomeController < Storytime::PagesController
  include Storytime::Concerns::CurrentSite
  layout :set_layout
  helper_method :current_storytime_site
  before_action :load_page

  def index
    # render landing page
  end

  private
    def load_page
      @page = @current_storytime_site.homepage
    end

end
