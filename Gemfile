source 'https://rubygems.org'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'bootstrap-sass'
gem 'decent_exposure'
gem 'dummy_image'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rails', '3.2.8'
gem 'sass-rails'
gem 'rdiscount'

group :assets do
  gem 'uglifier'
end

group :production do
  gem 'pg'
  gem 'thin'
end

group :development do
  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-rails'
  gem 'heroku'

  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
end