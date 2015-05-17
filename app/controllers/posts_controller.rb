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
        authorize @post #authorize() will check the policy on new post resources
       # if user is present it wll let it render if no user present itll give exception
  end

  def create
    #@post = Post.new(params.require(:post).permit(:title, :body))
    #require and permit make sure only certain keys are passed to Post.new
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.topic = @topic
    authorize @post #authorize() will check if user is logged in if not itll give an exception
    
    if @post.save
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
      authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated and captured your new update."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

end
