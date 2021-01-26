Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET']
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_SECRET"], skip_jwt: true
end