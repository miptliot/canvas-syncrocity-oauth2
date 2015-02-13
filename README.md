# canvas-synchrocity-oauth2
Canvas plugin to add synchrocity oauth2 authentication

Put to vendor/plugins folder

Make sure canvas_root/config/initializers/omniauth.rb contains:

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :chronocity_oauth2, 'your_api_key', 'your_api_secret'
end

callback url is http://domain/auth/chronocity_oauth2/callback
