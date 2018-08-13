ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
require 'dotenv/load' if ENV['RUBY_ENV'] == "development" || ENV['RUBY_ENV'] == "test" # Use dotenv gem to load .env file variables into environment.
