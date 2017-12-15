class PostsController < ApplicationController
  # This page requires the user to be logged in
  before_action :confirm_logged_in
  before_action :find_topic
  # Initialise the creation of a post with default values
  def new
    @post = Post.new(topic_id: @topic.id, content: '', user_id: session[:id])
    @topics = @topic.category.topics.sorted
    @post_count = Post.count + 1
  end
  # Index page shows the posts sorted by creation date
  def index
    @posts = @topic.posts.sorted
  end
  # Edit page finds the id of the current post from the parameters
  def edit
    @post = Post.find(params[:id])
    @topics = @topic.category.topics.sorted
    @post_count = Post.count
  end
  # Delete page finds the id of the current post from the parameters
  def delete
    @post = Post.find(params[:id])
  end
  # Update page updates the attributes of the current post
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'Post updated successfully.'
      redirect_to(action: 'index', topic_id: @topic.id)
    else
      @topics = @topic.category.topics.sorted
      @post_count = Post.count
      render('edit')
    end
  end
  # Create a new post if the details are valid
  def create
    @post = Post.new(post_params)
    @post.topic_id = @topic.id
    @post.user_id = session[:id]
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to(action: 'index', topic_id: @topic.id)
    else
      @topics = @topic.category.topics.sorted
      @post_count = Post.count + 1
      render('new')
    end
  end
  # Destroy (delete from the database) the current post
  def destroy
    post = Post.find(params[:id]).destroy
    flash[:notice] = "Post '#{post.content}' destroyed successfully."
    redirect_to(action: 'index', topic_id: @topic.id)
  end
  # Increase the number of upvotes for a post, if the vote is valid
  def upvote
    @post = Post.find(params[:id])
    @post_count = Post.count
    @vote = Vote.new(user_id: session[:id], post_id: @post.id, score: 1)
    if @vote.save
      @post.update_attribute(:respect, @post.respect + 1)
      flash[:notice] = 'Post upvoted successfully'
    end
    redirect_to(action: 'index', topic_id: @topic.id)
  end
  # Increase the number of downvotes for a post, if the vote is valid
  def downvote
    @post = Post.find(params[:id])
    @post_count = Post.count
    @vote = Vote.new(user_id: session[:id], post_id: @post.id, score: -1)
    if @vote.save
      @post.update_attribute(:respect, @post.respect - 1)
      flash[:notice] = 'Post downvoted successfully'
    end
    redirect_to(action: 'index', topic_id: @topic.id)
  end
  # Clear an upvote, if the vote exists
  def clearupvote
    @post = Post.find(params[:id])
    @post_count = Post.count
    @vote = Vote.where(user_id: session[:id], post_id: @post.id, score: 1)
    if @vote.exists?
      Vote.destroy(@vote.pluck(:id)[0])
      @post.update_attribute(:respect, @post.respect - 1) # Update post respect
      flash[:notice] = 'Vote cleared successfully'
    end
    redirect_to(action: 'index', topic_id: @topic.id)
  end
  # Clear a downvote, if the vote exists
  def cleardownvote
    @post = Post.find(params[:id])
    @post_count = Post.count
    @vote = Vote.where(user_id: session[:id], post_id: @post.id, score: -1)
    if @vote.exists?
      Vote.destroy(@vote.pluck(:id)[0])
      @post.update_attribute(:respect, @post.respect + 1) # Update post respect
      flash[:notice] = 'Vote cleared successfully'
    end
    redirect_to(action: 'index', topic_id: @topic.id)
  end

  private
  # Set the permitted parameters for posts
  def post_params
    params.require(:post).permit(:topic_id, :content, :user_id, :created_at)
  end
  # Find the topic by the given parameter id
  def find_topic
    @topic = Topic.find(params[:topic_id]) if params[:topic_id]
  end
end
