class TopicsController < ApplicationController
  def index
    #@topics = Topic.all
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def new
    @topic = Topic.new
    #@name = @topic.posts.name
    #@description = @topic.description
    authorize @topic
  end

  def show
    #@topic = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    @topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(post_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(post_params) 
    #@topic.update.attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to @topic, notice: "Topic was updated successfully"
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end


  private

  def post_params
    params.require(:topic).permit(:name, :description, :public)
  end

end
