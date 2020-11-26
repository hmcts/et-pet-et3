require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require_relative '../lib/form_builder'

module Et3
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.action_mailer.default_options = { from: 'no-reply@digital.justice.gov.uk' }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionView::Base.default_form_builder = FormBuilder

    config.time_zone = "London"
    if ENV.key? 'SMTP_HOSTNAME'
      config.action_mailer.smtp_settings = {
          address: ENV['SMTP_HOSTNAME'],
          port: ENV['SMTP_PORT'],
          domain: ENV['SENDING_HOST'],
          user_name: ENV['SMTP_USERNAME'],
          password: ENV['SMTP_PASSWORD'],
          authentication: :login,
          enable_starttls_auto: true
      }
    end

    config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info').to_sym

    insights_key = ENV.fetch('AZURE_APP_INSIGHTS_KEY', false)
    if insights_key
      config.azure_insights.enable = true
      config.azure_insights.key = insights_key
      config.azure_insights.role_name = ENV.fetch('AZURE_APP_INSIGHTS_ROLE_NAME', 'et3')
      config.azure_insights.role_instance = ENV.fetch('HOSTNAME', 'all')
      config.azure_insights.buffer_size = 500
      config.azure_insights.send_interval = 60
    else
      config.azure_insights.enable = false
    end

  end
end
