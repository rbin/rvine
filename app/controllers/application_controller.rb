class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate!
    if signed_in?
      return true
    else
      flash[:error] = "You aren't authorized to access this page"
      redirect_to(root_path)
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def signed_in?
    !!current_user
  end
  helper_method :signed_in?
end
