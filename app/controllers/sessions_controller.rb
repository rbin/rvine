class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    flash[:success] = "Welcome to the club!"
    redirect_to dashboard_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
