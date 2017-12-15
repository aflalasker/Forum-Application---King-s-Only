class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Check if the user is logged in while using the application
  def confirm_logged_in
    if session[:id]
      true
    else
      flash[:notice] = 'Login required'
      redirect_to(controller: 'access', action: 'index')
      false
    end
  end
end
