Rails.application.routes.draw do

  root 'access#index'
  get '/login', to: 'access#login'
  match '/auth/:provider/callback', to: 'access#callback', via: %i[get post]
  match '/send_mail', to: 'access#send_mail', via: %i[post]
  match '/disconnect', to: 'access#disconnect', via: %i[get]
  match ':controller(/:action(/:id))', :via => [:get, :post]

end
