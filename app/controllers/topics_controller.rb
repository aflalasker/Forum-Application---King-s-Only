class TopicsController < ApplicationController
  
    before_action :confirm_logged_in
    before_action :find_category
  
    def new
      @topic = Topic.new({:category_id => @category.id, :name => "Default"})
      @categories = Category.sorted
      @topic_count = Topic.count + 1
    end

    def index
      @topics = @category.topics.sorted
    end
    
    def catIndex 
      @categories = Category.sorted
    end   

    def edit
      @topic = Topic.find(params[:id])
      @categories = Category.sorted
      @topic_count = Topic.count
    end

  def delete
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic updated successfully."
      redirect_to(:action => 'index', :category_id => @category.id)
    else
      @categories = Category.sorted
      @topic_count = Topic.count
      render('edit')
    end
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic created successfully."
      redirect_to(:action => 'index', :category_id => @category.id)
    else
      @categories = Category.sorted
      @topic_count = Topic.count + 1
      render('new')
    end
  end
  
    def destroy
      topic = Topic.find(params[:id]).destroy
      flash[:notice] = "Topic '#{topic.name}' destroyed successfully."
      redirect_to(:action => 'index', :category_id => @category.id)
    end
  
  private
    def topic_params
      params.require(:topic).permit(:category_id, :name, :permalink, :created_at)
    end
    
    def find_category
      if params[:category_id]
        @category = Category.find(params[:category_id])
      end
    end
end
