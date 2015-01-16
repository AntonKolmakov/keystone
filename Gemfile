source 'https://rubygems.org'

# Specify ruby version for Heroku
ruby '2.1.2'

# Core gems
gem 'rails'
gem 'pg'
gem 'unicorn'

# Asset gems
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'

# Gems for easy developing
gem 'seedbank' # For envirnoment-specific seeds
gem 'devise'
gem 'decent_exposure'
gem 'responders'
gem 'slim'
gem 'bootstrap_form'
gem 'carrierwave'
gem 'rmagick', :require => 'RMagick'

group :development do
  gem 'spring'
  gem 'foreman'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'faker'
  gem 'launchy'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
end

gem 'rails_12factor', group: :production