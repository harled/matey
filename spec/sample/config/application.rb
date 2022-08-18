require_relative "boot"

require "rails/all"
# require "active_model/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
require "sprockets/railtie"

require "view_component"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_controller.asset_host = "http://assets.example.com"
  end
end

Sample::Application.config.secret_key_base = "foo"
