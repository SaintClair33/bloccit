class PostsController < ApplicationController
  #def index #for the index page
      #@posts = Post.all #gets all data from posts table and sends
      #it to the array posts
      #authorize @posts  #want to lists our posts publicly
  #end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    # if user is present it wll let it render if no user present itll give exception
  end


  def create
    # @post = Post.new(params.require(:post).permit(:title, :body))
    #require and permit make sure only certain keys are passed to Post.new
    @topic = Topic.find(params[:topic_id])
    #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    # @comment = Comment.find(params[:id])
    authorize @post #authorize() will check if user is logged in if not itll give an exception
    # authorize @comment
    
      if @post.save
        @post.create_vote
        flash[:notice] = "Your new post was created and saved."
        redirect_to [@topic, @post] #takes you to the new post you created
      else
        flash[:error] = "There was an error saving the post. Please try again."
        render :new # it grabs the new.html.erb file and pastes it in the view
      end
  end


  def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      #@comment = Comment.find(params[:id])
      authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    #@post_check = current_user.posts.build(post_params)
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated and captured your new update."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :avatar)
  end

  

end
