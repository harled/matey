# frozen_string_literal: true

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require "bundler/gem_tasks"
require "rspec/core/rake_task"

APP_RAKEFILE = File.expand_path("spec/sample/Rakefile", __dir__)
load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

task default: %i[spec standard]
