require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Template
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # ********************         Work in progress   *********************************
    config.i18n.load_path += Dir[Rails.root.join( 'locales', '*.{yml}')]
    # Permitted locales available for the application
    I18n.available_locales = [:en, :fr]
    # Set default locale to something other than :en
    I18n.default_locale = :en

    # *********************************************************************************


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    
    
  end
end
