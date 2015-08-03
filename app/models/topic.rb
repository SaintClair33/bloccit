class Topic < ActiveRecord::Base

    has_many :posts, dependent: :destroy


    self.per_page=50

    default_scope {order('created_at DESC')}

    validates :name, length: { minimum: 5}, presence: true

    scope :visible_to, -> (user) { user ? all : where(public: true)}

    scope :publicly_viewable, -> {Topic.where(public: true)}

    scope :privately_viewable, -> {Topic.where(public: false)}
     
end
