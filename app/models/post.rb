class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes
  has_one :summary
  belongs_to :user #means the post table has the user table's primary key in it
  belongs_to :topic
  #has_one :summary
  mount_uploader :avatar, AvatarUploader
  default_scope {order('created_at DESC')}
  
  validates :title, length: {minimum: 5},  presence: true
  validates :body,  length: {minimum: 20}, presence: true
  #validates :topic, presence: true
  #validates :user, presence: true

  after_create :create_vote

  def create_vote
    # self == post
    votes.create! post: self, value: 1, user: self.user
  end


  def markdown_title
    (render_as_markdown).render(self.title).html_safe
  end
  

  def markdown_body
    (render_as_markdown).render(self.body).html_safe
  end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.pluck(:value).sum
  end

  private

  def render_as_markdown
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    return redcarpet
  end
end









