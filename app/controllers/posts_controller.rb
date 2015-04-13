class PostsController < ApplicationController
  def index #for the index page
      @posts = Post.all #gets all data from posts table and sends
      #it to the array posts
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
       
  end

  def create
    #@post = Post.new(params.require(:post).permit(:title, :body))
    #require and permit make sure only certain keys are passed to Post.new
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    
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
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated and captured your new update."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

end
