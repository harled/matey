# frozen_string_literal: true

source "https://rubygems.org"
gemspec

# rails_version = "#{ENV['RAILS_VERSION'] || 'main'}"
rails_version = (ENV["RAILS_VERSION"] || "~> 7").to_s
gem "rails", rails_version == "main" ? {git: "https://github.com/rails/rails", ref: "main"} : rails_version
gem "sqlite3", ">= 1.4"

gem "rake", "~> 13.0"

gem "rspec", "~> 3.0"
gem "rspec-rails", "~> 5.0.0"
gem "factory_bot_rails"

gem "standard", "~> 1.3"

gem "debug", platforms: %i[mri mingw x64_mingw]

if RUBY_VERSION >= "3.1"
  gem "net-imap", require: false
  gem "net-pop", require: false
  gem "net-smtp", require: false
end

gem "byebug", "~> 11.1", groups: [:development, :test]
