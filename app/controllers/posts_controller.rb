class PostsController < ApplicationController
  def index #for the index page
      @posts = policy_scope(Post) #gets all data from posts table and sends
      #it to the array posts
      #authorize @posts  #want to lists our posts publicly
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
        authorize @post #authorize() will check the policy on new post resources
       #if its satisfied or user is present it wll let it render if no user present itll give exception
  end

  def create
    #@post = Post.new(params.require(:post).permit(:title, :body))
    #require and permit make sure only certain keys are passed to Post.new
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post #authorize() will check the policy on creating post resources
    
    if @post.save
      flash[:notice] = "Your new post was created and saved."
      redirect_to @post #takes you to the new post you created
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new # it grabs the new.html.erb file and pastes it in the view
    end
  end


  def edit
      @post = Post.find(params[:id])
      authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated and captured your new update."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

end
