class Reply < ActiveRecord::Base
  attr_accessible :content, :topic, :user

  belongs_to :topic
  belongs_to :user
end
