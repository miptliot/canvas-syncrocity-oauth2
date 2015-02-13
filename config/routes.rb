CanvasRails::Application.routes.draw do
  match '/auth/chronocity_oauth2/callback' => 'oauthclient#create'
  resources :oauthclient, :only => [:index, :create]
end
