class PostsController < ApplicationController
  
    before_action :confirm_logged_in
    before_action :find_topic
  
    def new
      @post = Post.new({:topic_id => @topic.id, :content => "Default"})
      @topics = @topic.category.topics.sorted
      @post_count = Post.count + 1
    end

    def index
      @posts = @topic.posts.sorted
    end

    def edit
      @post = Post.find(params[:id])
      @topics = @topic.category.topics.sorted
      @post_count = Post.count
    end

  def delete
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
      redirect_to(:action => 'index', :topic_id => @topic.id)
    else
      @topics = @topic.category.topics.sorted
      @post_count = Post.count
      render('edit')
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.topic_id = @topic.id
    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to(:action => 'index', :topic_id => @topic.id)
    else
      @topics = @topic.category.topics.sorted
      @post_count = Post.count + 1
      render('new')
    end
  end
  
    def destroy
      post = Post.find(params[:id]).destroy
      flash[:notice] = "Post '#{post.content}' destroyed successfully."
      redirect_to(:action => 'index', :topic_id => @topic.id)
    end
  
  private
    def post_params
      params.require(:post).permit(:topic_id, :content, :created_at)
    end
    
    def find_topic
      if params[:topic_id]
        @topic = Topic.find(params[:topic_id])
      end
    end
    
end
