require_relative "lib/matey/version"

Gem::Specification.new do |spec|
  spec.name = "matey"
  spec.version = Matey::VERSION

  # Former authors include:
  # Suvasan Krishnasamy / suvasan@harled.ca
  # Caitlin Henry / caitlin@harled.ca

  spec.authors = ["Jon Loos", "Chris Young"]
  spec.email = ["jon@harled.ca", "chris@harled.ca"]

  spec.summary = "Track user engagement using Ahoy and ViewComponents."
  spec.description = "ViewComponents that are helpful in viewing user engagement metrics from Ahoy."
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

  spec.add_dependency "view_component", "~> 3.9"
  spec.add_dependency "ahoy_matey", ">= 4.0"
  spec.add_dependency "groupdate", "~> 6.4"

  spec.add_development_dependency "rspec-rails", "~> 7.1"
  spec.add_development_dependency "factory_bot_rails", "~> 6.0"
  spec.add_development_dependency "sprockets-rails", "~> 3.2.2"
  spec.add_development_dependency "sqlite3", "~> 1.0"
  spec.add_development_dependency "debug", "~> 1.0"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "rake", "~> 13.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
