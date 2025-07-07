require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Et3
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0
    config.action_mailer.default_options = { from: ENV.fetch('SMTP_FROM',
                                                             'no-reply@employmenttribunals.service.gov.uk') }

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: ['assets', 'tasks'])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    ActionView::Base.default_form_builder = EtGdsDesignSystem.form_builder_class

    config.time_zone = "London"
    if ENV.key? 'SMTP_HOSTNAME'
      config.action_mailer.smtp_settings = {
        address: ENV['SMTP_HOSTNAME'],
        port: ENV.fetch('SMTP_PORT', nil),
        domain: ENV.fetch('SENDING_HOST', nil),
        user_name: ENV.fetch('SMTP_USERNAME', nil),
        password: ENV.fetch('SMTP_PASSWORD', nil),
        authentication: :login,
        enable_starttls_auto: true
      }
    end

    config.secure_cookies = false
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

    config.maintenance_enabled = ENV.fetch('MAINTENANCE_ENABLED', 'false').downcase == 'true'
    config.maintenance_allowed_ips = ENV.fetch('MAINTENANCE_ALLOWED_IPS', '').split(',').map(&:strip)
    config.maintenance_end = ENV.fetch('MAINTENANCE_END', nil)
    config.et_gds_design_system.api_url = ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')
    config.dynatrace_ui_tracking_id = ENV.fetch('DYNATRACE_UI_TRACKING_ID', nil)
    # config.assets = ActiveSupport::OrderedOptions.new
    # config.assets.precompile = []
    # config.assets.paths = []
    config.mission_control.jobs.base_controller_class = "JobsController"
    config.browser_poll_time = 60
  end
end
