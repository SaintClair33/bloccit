class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:body))
    @comment.user = current_user

    @comment.save!#save the code down in the database

    redirect_to [@topic, @post]
  end
end
