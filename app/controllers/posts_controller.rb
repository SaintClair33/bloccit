class PostsController < ApplicationController
  def index #for the index page
      @posts = Post.all #gets all data from posts table and sends
      #it to the array posts
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end
end
