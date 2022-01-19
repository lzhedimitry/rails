# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Conduit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.api_only = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end
        
        


        resource '/api/*',
                 headers: :any,
                 methods: %i[get post delete put patch options head]
      end
    end
  end
end
