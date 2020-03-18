require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require "active_record/railtie"
require "action_controller/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShortUrlApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.api_only = true
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, 
                      methods: %i[get post put deleteoptions]
      end
    end
  end
end
