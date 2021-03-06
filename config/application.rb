require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rest-client'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Provisioner = Jellyfish::Provisioner
module JellyfishCore
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    ActiveSupport::JSON::Encoding.encode_big_decimal_as_string = false

    config.generators.helper = false
    config.generators.views = false
    config.generators.assets = false
    config.active_record.raise_in_transactional_callbacks = true

    config.active_record.raise_in_transactional_callbacks = true

    # Disable the assets pipeline; 100% external with Gulp
    config.assets.enabled = false
  end
end
