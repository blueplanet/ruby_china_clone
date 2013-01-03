class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :topics, :class_name => "Topic", :foreign_key => "author_id"
end
