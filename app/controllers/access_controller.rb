class AccessController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Specifies endpoint for connecting to the Microsoft Graph
  GRAPH_RESOURCE = 'https://graph.microsoft.com'.freeze
  SENDMAIL_ENDPOINT = '/v1.0/me/microsoft.graph.sendmail'.freeze
  CONTENT_TYPE =
    'application/json;odata.metadata=minimal;odata.streaming=true'.freeze

  # Reset current session and redirect to Microsoft login page
  def login
    reset_session
    redirect_to '/auth/microsoft_v2_auth'
  end

  # Redirect user to the forum index page if already logged in
  def index
    return unless session[:id]
    flash[:notice] = 'Welcome back to the forum!'
    redirect_to '/categories#index'
  end

  # Callback page after Microsoft Login, getting the user data and inserting the user (if the user does not exist)
  # in the database. Afterwards, the user is redirected to the forum index.
  def callback
    data = request.env['omniauth.auth']
    @email = data[:extra][:raw_info][:userPrincipalName] # Email retreived from Microsoft Graph
    @name = data[:extra][:raw_info][:displayName] # Name retrieved from Microsoft Graph
    session[:access_token] = data['credentials']['token']
    session[:name] = @name # Save the user's name in the session
    session[:email] = @email # Save the user's email in the session
    if @email.end_with? '@kcl.ac.uk'
      flash[:notice] = 'You have been logged in.'
      @first_name = @name.split(', ')[1] # Retrieve the first name of the person
      @last_name = @name.split(', ')[0] # Retrieve the last name of the person
      @role = 1 # Assign user to staff initially
      @role = 0 unless StaffList.exists?(email: @email) # Unassign user from staff and make the user a student if it is not part of the staff.
      @user = User.new(first_name: @first_name, last_name: @last_name,
                       email: @email, role: @role) # Create a new user with the details
      if @user.save # Check if saving to the database works, as the user may already be in the database.
        session[:id] = @user.pluck(:id)[0] # Save the user id in the session
        session[:role] = @role # Save the role in the session
        flash[:notice] = 'You have logged in for the first time. Welcome!'
      else
        session[:id] = User.where(email: @email).pluck(:id)[0] # Save the user id in the session
        session[:role] = @role # Save the role in the session
        flash[:notice] = 'You have been logged in. Welcome!'
      end
      redirect_to '/categories#index'
    else
      flash[:notice] = "You have been disconnected because your email is not a valid King's College London address."
      redirect_to '/disconnect'
    end
  end

  # Use omniauth environment
  def auth_hash
    request.env['omniauth.auth']
  end
  
  # Logout user and reset session
  def disconnect
    reset_session
    flash[:notice] = 'You have been logged out.'
    redirect_to '/'
  end
end
