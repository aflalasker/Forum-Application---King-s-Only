class TopicsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_subject
  
  
  def new
    @topic = Topic.new({:category_id => @category.id, :name => "Default"})
    @category = Category.order('created_at ASC')
    @topic_count = Topic.count + 1
  end

  def index
    @topic = @category.pages.sorted
  end

  def edit
    @topic = Topic.find(params[:id])
    @category = Category.order('created_at ASC')
    @topic_count = Topic.count
  end

  def delete
    @topic = Topic.find(params[:id])
  end
end
