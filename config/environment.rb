# Load the Rails application.
require File.expand_path('../application', __FILE__)

# The following values must match the client ID, secret, and reply URL
# in your Microsoft App Registration Portal entry for your app.

# dee data

# ENV['CLIENT_ID'] = '85f1ef61-f210-4c18-afbf-9fcfb8093a73'
# ENV['CLIENT_SECRET'] = 'kfnlwCUORLO21)-^-czG040'

# alin data

ENV['CLIENT_ID'] = '3978b7b5-5f45-4b68-a466-639d49b6e002'
ENV['CLIENT_SECRET'] = 'znePVVDGD286@rhbaW97*:('

# jakub data
# ENV['CLIENT_ID'] = 'f433758e-e631-4fa2-aa1f-6c1760107228'
# ENV['CLIENT_SECRET'] = 'svalKWUEGO860:~[jvxG57+'

ENV['OAUTH_SCOPE'] =
  'openid ' \
  'email ' \
  'profile ' \
  'https://graph.microsoft.com/User.Read ' \
  'https://graph.microsoft.com/Mail.Send'

# Initialize the Rails application.
Rails.application.initialize!
