Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :dbc, ENV['OAUTH_TOKEN'], ENV['OAUTH_SECRET']
end