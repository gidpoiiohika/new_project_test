source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'
gem "faker"
gem 'sidekiq'

group :development, :test do
  gem "byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
end

group :test do
  gem 'simplecov', require: false
  gem "factory_bot_rails"
end


