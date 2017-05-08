source 'https://rubygems.org'

# Rails Version locked to last 4.2.x
gem 'rails', '4.2.8'

# View support
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'haml-rails'
gem 'high_voltage'

# Database support
gem 'pg'

# Authentication and authorization
gem 'devise'
gem 'pundit'

# pagination
gem 'kaminari'

# heroku support
gem 'rails_12factor'

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-unicorn'
  gem 'foreman'
  gem 'html2haml'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

# Use Unicorn for production server
group :production do
  gem 'unicorn'
end
