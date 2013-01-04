class RepliesController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    reply = topic.replies.build params[:reply]
    reply.user = current_user
    reply.save

    redirect_to topic
  end
end
