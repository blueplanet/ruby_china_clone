class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    User.create(params[:user])

    redirect_to root_path
  end
end
