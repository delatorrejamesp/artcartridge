source 'https://rubygems.org'

require 'rbconfig'
  if RbConfig::CONFIG['target_os'] =~ /darwin(1[0-3])/i
    gem 'rb-fsevent', '<= 0.9.4'
  end

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
# gem 'pg', group: :production
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise-bootstrap-views'

gem 'aws-sdk', '~> 2.3'
gem "paperclip", "~> 5.0.0"
gem 'paperclip-av-transcoder'
gem "paperclip-ffmpeg"
gem "delayed_paperclip"

gem 'dotenv-rails', :groups => [:development, :test]

gem 'cancan'
gem 'friendly_id'

gem 'country_select'
gem 'social-share-button'
gem 'shareable'
gem 'kaminari'
gem 'dropzonejs-rails'
gem 'jquery-infinite-pages', git: 'https://github.com/magoosh/jquery-infinite-pages.git', ref: 'master'
gem 'rails_admin', '~> 1.1.1'
gem "cancan"
gem 'pg'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'commontator', '~> 4.11.1'
gem 'instagram'
gem "select2-rails"
gem 'acts_as_votable', '~> 0.10.0'
gem 'jquery-ui-rails'
