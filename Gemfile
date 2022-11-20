# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'devise'
gem 'devise-jwt'
gem 'faker'
gem 'jbuilder'
gem 'paper_trail'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'rubocop', require: false
gem 'sidekiq'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
end
