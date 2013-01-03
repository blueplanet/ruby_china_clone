class Topic < ActiveRecord::Base
  attr_accessible :title, :node, :content, :node_id, :author

  belongs_to :node
  belongs_to :author, class_name: "User"
end
