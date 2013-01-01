class Node < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :topics
end
