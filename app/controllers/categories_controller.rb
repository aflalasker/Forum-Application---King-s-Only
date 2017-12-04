class CategoriesController < ApplicationController
  
  before_action :confirm_logged_in
  
  def index
    @categories = Category.sorted
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
    @category_count = Category.count
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Update made!"
      redirect_to(:action => 'index')
    else 
      @category_count = Category.count
      render('edit')
    end
  end
  def delete
    @category = Category.find(params[:id])
  end
  def destroy
    category = Category.find(params[:id]).destroy 
    flash[:notice] = "Category '#{category.name}' deleted"
    redirect_to(:action => 'index')
  end
  
  private 
  
    def category_params
      params.require(:category).permit(:name, :created_at)
    end
  
end
