class SessionsController < ApplicationController
  def new
    
  end

  def create
    session[:user_name] = params[:user_name]
    redirect_to root_path
  end
end
