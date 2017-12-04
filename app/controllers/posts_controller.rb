class PostsController < ApplicationController
  
    before_action :confirm_logged_in
  
    def new
      @post = Post.new({:content => "Default"})
      @post_count = Post.count + 1
    end

    def index
      @post = Post.sorted
    end

    def edit
      @post = Post.find(params[:id])
      @post_count = Post.count
    end

  def delete
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
      redirect_to(:action => 'index')
    else
      @post_count = Post.count
      render('edit')
    end
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to(:action => 'index')
    else
      @post_count = Post.count + 1
      render('new')
    end
  end
  
    def destroy
      post = Post.find(params[:id]).destroy
      flash[:notice] = "Post '#{post.name}' destroyed successfully."
      redirect_to(:action => 'index')
    end
    
    def post_params
      params.require(:post).permit(:content, :created_at)
    end
    
end
