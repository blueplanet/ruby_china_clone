class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.new params[:topic]
    topic.author = current_user
    topic.save

    redirect_to root_path
  end
end
