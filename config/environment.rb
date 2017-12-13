# Load the Rails application.
require File.expand_path('../application', __FILE__)

# The following values must match the client ID, secret, and reply URL
# in your Microsoft App Registration Portal entry for your app.
ENV['CLIENT_ID'] = '85f1ef61-f210-4c18-afbf-9fcfb8093a73'
ENV['CLIENT_SECRET'] = 'kfnlwCUORLO21)-^-czG040'
ENV['OAUTH_SCOPE'] =
  'openid ' \
  'email ' \
  'profile ' \
  'https://graph.microsoft.com/User.Read ' \
  'https://graph.microsoft.com/Mail.Send'

# Initialize the Rails application.
Rails.application.initialize!
