class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user #means the post table has the user table's primary key in it
    belongs_to :topic
  default_scope {order('created_at DESC')}
  #scope :ordered_by_title, -> { reorder(title: :ASC)}
  #scope :ordered_by_reverse_created_at, -> { reorder(created_at: :DESC)}

  
end



