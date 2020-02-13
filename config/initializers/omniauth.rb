# change :provider when decided (probably GOOGLE)

# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#     scope: ':email,name,username', display: 'popup'
#   end

  # Rails.application.config.middleware.use OmniAuth::Builder do
  #   provider :twitter, ENV["API_KEY"], ENV["API_SECRET"]
  # end 

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT'], ENV['GOOGLE_SECRET'], skip_jwt: true 
  end