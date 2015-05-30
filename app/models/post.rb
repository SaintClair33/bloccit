class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary
  belongs_to :user #means the post table has the user table's primary key in it
  belongs_to :topic
  #has_one :summary
  default_scope {order('created_at DESC')}
  
  validates :title, length: {minimum: 5},  presence: true
  validates :body,  length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  
end



