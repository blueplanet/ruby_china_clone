class Topic < ActiveRecord::Base
  attr_accessible :title, :node

  belongs_to :node
end
