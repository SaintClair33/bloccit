class Topic < ActiveRecord::Base
    has_many :posts



    default_scope {order('created_at DESC')}

    validates :name, length: { minimum: 5}, presence: true
     
end
