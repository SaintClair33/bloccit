class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :posts
  mount_uploader :avatar, AvatarUploader #AvatarUploader tells it which file to use for uploading avatars
  

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  
end
