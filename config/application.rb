# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Travelrama
  # Travelrama Application
  class Application < Rails::Application
    config.active_storage.routes_prefix = '/storage'
    config.exceptions_app = routes
    config.load_defaults 6.0
    config.autoload_paths += %W[#{config.root}/lib]
    config.logger = ActiveSupport::Logger.new(Rails.root.join('log', "#{Rails.env}.log"), 5, 100.megabytes)

    config.app_email = {
      display_name: 'Travelrama',
      address: 'travelrama@seroff.co'
    }

    config.icon_sizes = [16, 32, 96, 152, 192, 512]
    config.exceptions_app = routes

    config.i18n.default_locale = :en
    config.time_zone = 'Central Time (US & Canada)'
    config.version = Rails.root.join('config', 'version').read.strip
  end
end
