# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bcrypt'
gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'webrick'
gem 'rake'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

 ruby "3.0.0"
