require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Paranoya
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework  false
      g.stylesheets     false
      g.javascripts     false
      g.helpers         false
    end

    config.before_configuration do
      ['env.local.yml', 'env.yml'].each do |file_variation|
        env_file = File.join(Rails.root, 'config', file_variation)
        settings = YAML.load(File.open(env_file)) if File.exists?(env_file)
        settings.each do |key, value|
          ENV[key.to_s] = value unless ENV[key.to_s].present?
        end if settings.respond_to?(:each)
      end
    end

    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru

    config.active_job.queue_adapter = :sidekiq
  end
end
