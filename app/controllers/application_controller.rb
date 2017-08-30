class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def storytime_post_param_additions
    attrs = [:post_category_id]
    attrs
  end

  def authenticate_admin_user!
    if !current_user&.admin?
      flash[:error] = t('defaults.not_authorized')
      redirect_to(request.referrer || "/")
    end
  end

end
