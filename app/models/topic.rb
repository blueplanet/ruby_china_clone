class Topic < ActiveRecord::Base
  attr_accessible :title, :node, :content, :node_id

  belongs_to :node
end
