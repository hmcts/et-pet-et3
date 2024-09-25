Capybara.configure do |config|
  driver = ENV.fetch('TEST_BROWSER', 'chrome_local').to_sym
  config.javascript_driver = driver
  config.default_max_wait_time = 10
  config.match = :prefer_exact
  config.exact = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.server = :webrick
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox, url: ENV.fetch('SELENIUM_URL', 'http://localhost:4444/wd/hub'))
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, url: ENV.fetch('SELENIUM_URL', 'http://localhost:4444/wd/hub'))
end

Capybara.register_driver :chrome_local do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--headless=new')
  options.add_argument('--lang=en-GB')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :chrome_local_visible do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :firefox_local do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('-headless')
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.register_driver :firefox_local_visible do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.always_include_port = true
Capybara.always_include_port = true
if [:firefox, :chrome].include?(Capybara.javascript_driver)
  Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST', "http://localhost.from.docker")
  Capybara.server_host = ENV.fetch('CAPYBARA_SERVER_HOST', '0.0.0.0')
end
Capybara.app_host = ENV.fetch('CAPYBARA_APP_HOST') if ENV.key?('CAPYBARA_APP_HOST')
Capybara.server_host = ENV.fetch('CAPYBARA_SERVER_HOST') if ENV.key?('CAPYBARA_SERVER_HOST')
Capybara.server_port = ENV.fetch('CAPYBARA_SERVER_PORT') if ENV.key?('CAPYBARA_SERVER_PORT')
