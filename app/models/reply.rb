class Reply < ActiveRecord::Base
  attr_accessible :content, :topic

  belongs_to :topic
end
