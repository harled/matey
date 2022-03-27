# frozen_string_literal: true

require_relative "lib/matey/version"

Gem::Specification.new do |spec|
  spec.name = "matey"
  spec.version = Matey::VERSION
  spec.authors = ["Chris Young"]
  spec.email = ["chris@harled.ca"]

  spec.summary = "A gem to track user engagement using Ahoy."
  spec.description = "This gem provides a number of ViewComponents that are helpful in viewing user engagement metrics from Ahoy."
  spec.homepage = "https://github.com/harled/matey"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/harled/matey"
  spec.metadata["changelog_uri"] = "https://github.com/harled/matey/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 7"
  spec.add_dependency "view_component"
  spec.add_dependency "ahoy_matey"

  spec.add_development_dependency "rspec-rails", "~> 5.0"
  spec.add_development_dependency "sprockets-rails", "~> 3.2.2"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "debug"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
