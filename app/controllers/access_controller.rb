class AccessController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Specifies endpoint for connecting to the Microsoft Graph
  GRAPH_RESOURCE = 'https://graph.microsoft.com'.freeze
  SENDMAIL_ENDPOINT = '/v1.0/me/microsoft.graph.sendmail'.freeze
  CONTENT_TYPE =
    'application/json;odata.metadata=minimal;odata.streaming=true'.freeze

  def login
    reset_session
    redirect_to '/auth/microsoft_v2_auth'
  end

  def index
    return unless session[:id]
    flash[:notice] = 'Welcome back to the forum!'
    redirect_to '/categories#index'
  end

  def callback
    data = request.env['omniauth.auth']
    @email = data[:extra][:raw_info][:userPrincipalName]
    @name = data[:extra][:raw_info][:displayName]
    session[:access_token] = data['credentials']['token']
    session[:name] = @name
    session[:email] = @email
    if @email.end_with? '@kcl.ac.uk'
      flash[:notice] = 'You have been logged in.'
      @first_name = @name.split(', ')[1]
      @last_name = @name.split(', ')[0]
      @role = 0
      @role = 1 if StaffList.exists?(email: @email) # || @first_name == 'Alin'
      @user = User.new(first_name: @first_name, last_name: @last_name,
                       email: @email, role: @role)
      if @user.save
        session[:id] = @user.pluck(:id)[0]
        session[:role] = @role
        flash[:notice] = 'You have logged in for the first time. Welcome!'
      else
        session[:id] = User.where(email: @email).pluck(:id)[0]
        session[:role] = @role
        flash[:notice] = 'You have been logged in. Welcome!'
      end
      redirect_to '/categories#index'
    else
      redirect_to '/disconnect'
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def disconnect
    reset_session
    flash[:notice] = 'You have been logged out.'
    redirect_to '/'
  end
end
