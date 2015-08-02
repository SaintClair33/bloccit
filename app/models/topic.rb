class Topic < ActiveRecord::Base

    has_many :posts, dependent: :destroy


    self.per_page=50

    default_scope {order('created_at DESC')}
    scope :visible_to, -> (user) { user ? all : where(public: true)}

    validates :name, length: { minimum: 5}, presence: true
     
end
