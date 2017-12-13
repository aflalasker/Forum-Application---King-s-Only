class AccessController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  # Specifies endpoint for connecting to the Microsoft Graph
  GRAPH_RESOURCE = 'https://graph.microsoft.com'.freeze
  SENDMAIL_ENDPOINT = '/v1.0/me/microsoft.graph.sendmail'.freeze
  CONTENT_TYPE =
    'application/json;odata.metadata=minimal;odata.streaming=true'.freeze

  # Delegates the browser to the v2 authentication OmniAuth module
  # which takes the user to a sign-in page, if we don't have tokens already
  # This sample uses an open source OAuth 2.0 library that is compatible with
  # the Azure AD v2.0 endpoint.
  # Microsoft does not provide fixes or direct support for this library.
  # Refer to the library's repository to file issues or for other support.
  # For more information about auth libraries see: https://azure.microsoft.com/documentation/articles/active-directory-v2-libraries/
  # omniauth-oauth2 repo:  https://github.com/intridea/omniauth-oauth2
  def login
    logger.info session[:access_token]
    if !session[:id]
      reset_session
      redirect_to '/auth/microsoft_v2_auth'
    else 
      flash[:notice] = "Welcome back to the forum!"
      redirect_to '/categories#index'
    end
  end

  def callback
    data = request.env['omniauth.auth']

    @email = data[:extra][:raw_info][:userPrincipalName]
    @name = data[:extra][:raw_info][:displayName]

    session[:access_token] = data['credentials']['token']
    session[:name] = @name
    session[:email] = @email
    logger.info session[:access_token]
    if @email.end_with? "@kcl.ac.uk"
      flash[:notice] = "You have been logged in."
      @first_name = @name.split(", ")[1]
      @last_name = @name.split(", ")[0]
      @role = 0
      if StaffList.exists?(email: @email) #|| @first_name == 'Alin'
        @role = 1
      end
      @user = User.new(:first_name => @first_name, :last_name => @last_name, :email => @email, :role => @role)
      if @user.save
        session[:id] = (@user.pluck(:id))[0]
        session[:role] = @role
        flash[:notice] = "You have logged in for the first time. Welcome!"
      else
        session[:id] = (User.where(:email => @email).pluck(:id))[0]
        session[:role] = @role
        flash[:notice] = "You have been logged in. Welcome!"
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
    logger.info session[:access_token]
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to '/'
  end
  
end
