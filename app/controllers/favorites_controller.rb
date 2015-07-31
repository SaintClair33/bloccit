class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post_id: post.id)
    authorize favorite
    if favorite.save
      flash[:notice] = "This post is now favorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error favoriting you post.  Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post_id: post.id)
    authorize favorite
    if favorite.destroy
      flash[:notice] = "This post is now unfavorited"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error unfavoriting your post.  Please try again."
      redirect_to [post.topic, post]
    end
  end
end
