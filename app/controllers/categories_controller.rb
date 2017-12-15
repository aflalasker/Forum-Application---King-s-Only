class CategoriesController < ApplicationController
  # This page requires the user to be logged in
  before_action :confirm_logged_in
  # Index page shows the categories sorted by creation date
  def index
    @categories = Category.sorted
  end

  # Edit page finds the id of the current category from the parameters
  def edit
    @category = Category.find(params[:id])
    @category_count = Category.count
  end
  
  # Update page updates the attributes of the current category
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = 'Update made!'
      redirect_to(action: 'index')
    else
      @category_count = Category.count
      render('edit')
    end
  end
  # Delete page finds the id of the current topic from the parameters
  def delete
    @category = Category.find(params[:id])
  end
  # Destroy (delete from the database) the current category
  def destroy
    category = Category.find(params[:id]).destroy
    flash[:notice] = "Category '#{category.name}' deleted"
    redirect_to(action: 'index')
  end

  private
  # Set the permitted parameters for categories
  def category_params
    params.require(:category).permit(:name, :created_at)
  end
end
