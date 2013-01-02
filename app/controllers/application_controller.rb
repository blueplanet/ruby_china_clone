class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private
  def current_user
    user = User.new
    user = User.find_by_name(session[:user_name]) if session[:user_name]
    user
  end
end
