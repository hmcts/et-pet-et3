require 'capybara/cuprite'
Capybara.configure do |config|
  driver = ENV.fetch('TEST_BROWSER', 'cuprite').to_sym
  config.javascript_driver = driver
  config.default_max_wait_time = 10
  config.match = :prefer_exact
  config.exact = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.server = :webrick
end

cuprite_options = {
  'no-sandbox': nil,
  'disable-gpu': nil,
  'disable-software-rasterizer': nil,
  'disable-dev-shm-usage': nil,
  'disable-smooth-scrolling': true
}
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app,
                                window_size: [1600, 1000],
                                timeout: 10,
                                browser_options: cuprite_options,
                                js_errors: true,
                                process_timeout: 30,
                                browser_timeout: 30)
end

Capybara.register_driver(:cuprite_visible) do |app|
  Capybara::Cuprite::Driver.new(app,
                                window_size: [1600, 1000],
                                headless: false,
                                timeout: 10,
                                browser_options: cuprite_options,
                                js_errors: true,
                                process_timeout: 30,
                                browser_timeout: 30)
end

Capybara.always_include_port = true
Capybara.always_include_port = true
if [:firefox, :chrome].include?(Capybara.javascript_driver)
  Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST', "http://localhost.from.docker")
  Capybara.server_host = ENV.fetch('CAPYBARA_SERVER_HOST', '0.0.0.0')
end
if ENV['TEST_URL'].present?
  Capybara.app_host = ENV['TEST_URL']
  Capybara.run_server = false
else
  Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST') if ENV.key?('CAPYBARA_APP_HOST')
  Capybara.server_host = ENV.fetch('CAPYBARA_SERVER_HOST') if ENV.key?('CAPYBARA_SERVER_HOST')
  Capybara.server_port = ENV.fetch('CAPYBARA_SERVER_PORT') if ENV.key?('CAPYBARA_SERVER_PORT')
end
