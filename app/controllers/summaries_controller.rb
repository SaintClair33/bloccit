class SummariesController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    summary = @post.build_summary(body: params[:summary][:body])

    if summary.save
      flash[:notice] = "Your new post summary was created and saved."
      redirect_to [@topic, @post] #takes you to the new post you created
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new # it grabs the new.html.erb file and pastes it in the view
    end
  end
end