source 'https://rubygems.org'

#gem 'rails', '3.2.12'
gem 'rails', '~> 4.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

group :development do
  gem "rails-erd"
end

gem 'pry-rails', :group => [:development, :test]
gem 'puma', :group => [:development, :production]


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 5.0'
  gem 'coffee-rails', '~> 4.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails'
#gem 'faker'
gem 'bootstrap-sass', '~> 3.1.1'

group :doc do
  gem 'sdoc', require: false
end

gem 'faker'
gem 'devise'
gem 'pundit'
gem 'figaro', '1.0'
gem 'redcarpet'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'will_paginate', '~> 3.0.5'
gem 'newrelic_rpm'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'capybara'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
