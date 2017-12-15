class TopicsController < ApplicationController
  # This page requires the user to be logged in
  before_action :confirm_logged_in
  before_action :find_category
  # Initialise the creation of a post with default values
  def new
    @topic = Topic.new(category_id: @category.id, name: '', content: '', user_id: session[:id])
    @categories = Category.sorted
    @topic_count = Topic.count + 1
  end
  # Index page shows the topics sorted by creation date
  def index
    @topics = @category.topics.sorted
  end
  # Edit page finds the id of the current topic from the parameters
  def edit
    @topic = Topic.find(params[:id])
    @categories = Category.sorted
    @topic_count = Topic.count
  end
  # Delete page finds the id of the current topic from the parameters
  def delete
    @topic = Topic.find(params[:id])
  end
  # Update page updates the attributes of the current topic
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:notice] = 'Topic updated successfully.'
      redirect_to(action: 'index', category_id: @category.id)
    else
      @categories = Category.sorted
      @topic_count = Topic.count
      render('edit')
    end
  end
  # Create a new topic if the details are valid
  def create
    @topic = Topic.new(topic_params)
    @topic.category_id = @category.id
    @topic.user_id = session[:id]
    if @topic.save
      flash[:notice] = 'Topic created successfully.'
      redirect_to(action: 'index', category_id: @category.id)
    else
      @categories = Category.sorted
      @topic_count = Topic.count + 1
      render('new')
    end
  end
  # Destroy (delete from the database) the current topic
  def destroy
    topic = Topic.find(params[:id]).destroy
    flash[:notice] = "Topic '#{topic.name}' destroyed successfully."
    redirect_to(action: 'index', category_id: @category.id)
  end

  private
  # Set the permitted parameters for topic
  def topic_params
    params.require(:topic).permit(:id, :category_id, :name, :content, :user_id)
  end
  # Find the category by the given parameter id
  def find_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
