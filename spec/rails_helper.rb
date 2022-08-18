ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../sample/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
# require "view_component/test_helpers"

# load all factory bot files
SPEC_ROOT = Pathname.new(File.expand_path("../", __FILE__))
Dir[SPEC_ROOT.join("support/*.rb")].sort.each { |f| require f }
