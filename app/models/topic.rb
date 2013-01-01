class Topic < ActiveRecord::Base
  attr_accessible :title, :node, :content

  belongs_to :node
end
