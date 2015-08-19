class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.new(params.require(:comment).permit(:body))
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    @new_comment = Comment.new
    authorize @comment

    if @comment.save #save the code down in the database
      flash[:notice] = "Your comment was saved!"
    else
      flash[:error] = "Your comment failed to save."
    end

    redirect_to [@post.topic, @post]
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    #redirect_to [@post.topic, @post]

    respond_to do |format| #tell controller to responde via Ajax
      format.html #return response type in html
      format.js #return response type in js
    end
  end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
