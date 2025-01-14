# frozen_string_literal: true

source "https://rubygems.org"
gemspec

rails_version = (ENV["RAILS_VERSION"] || "~> 7").to_s
gem "rails", (rails_version == "main") ? {git: "https://github.com/rails/rails", ref: "main"} : rails_version

# gem "debug", platforms: %i[mri mingw x64_mingw]

gem "net-imap", require: false
gem "net-pop", require: false
gem "net-smtp", require: false
