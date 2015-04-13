class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user
  has_many :comments
  belongs_to :user #means the user table has the primary key and the post table is a foreign key to it
  default_scope {order('created_at DESC')}
  
end
