ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../sample/config/environment.rb', __FILE__)
# require "rails/test_help"

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
# require "view_component/test_helpers"