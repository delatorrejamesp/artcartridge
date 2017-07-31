
Instagram.configure do |config|
 config.client_id     = ENV['IG_CLIENT_ID']
 config.client_secret = ENV['IG_CLIENT_SECRET']
 config.access_token  = ENV['IG_ACCESS_TOKEN']
end
