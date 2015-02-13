CanvasRails::Application.routes.draw do
  match '/auth/syncrocity_oauth2/callback' => 'oauthclient#create'
  resources :oauthclient, :only => [:create]
end
