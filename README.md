# pupdates_backend

## About
  This app was created for the purpose of having a backend application that receives, displays, and modifies data for frontend_pupdates. The overall goal of the two apps is to provide dog owners with a fun and effective way of socializing their dogs with other owners. It was made in 12 days using Rails 5.2.4.1 and Ruby 2.4.1.

## Gems
  gem 'pg', '>= 0.18', '< 2.0'
  gem 'bcrypt', '~> 3.1.7'
  gem 'rspec-rails'
  gem 'faker'
  gem 'fast_jsonapi'
  gem 'table_print'

  group :development, :test do
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    gem 'factory_bot_rails'
    gem 'shoulda-matchers'
    gem 'pry'
    gem 'simplecov'
  end

  group :development do
    gem 'listen', '>= 3.0.5', '< 3.2'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
  end

## Configuration
  - Fork the repository then clone
  - Run `bundle install`
  - Run `rails db:{drop,create,migrate,seed}`

## Database Schema
![DBSchema](/bin/backend_pupdates_schema.png?raw=true "pupdates_schema")
