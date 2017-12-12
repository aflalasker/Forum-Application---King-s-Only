# Load the Rails application.
require File.expand_path('../application', __FILE__)

# The following values must match the client ID, secret, and reply URL
# in your Microsoft App Registration Portal entry for your app.
ENV['CLIENT_ID'] = '3978b7b5-5f45-4b68-a466-639d49b6e002'
ENV['CLIENT_SECRET'] = 'znePVVDGD286@rhbaW97*:('
ENV['OAUTH_SCOPE'] =
  'openid ' \
  'email ' \
  'profile ' \
  'https://graph.microsoft.com/User.Read ' \
  'https://graph.microsoft.com/Mail.Send'

# Initialize the Rails application.
Rails.application.initialize!
