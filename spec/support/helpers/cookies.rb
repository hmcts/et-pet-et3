module ET3
  module Test
    module Cookies
      def set_seen_cookie_policy
        cookie_value = ::Rack::Utils.escape('{"essential": true, "usage": true, "seen": false}')
        Capybara.current_session.driver.browser.current_session.set_cookie("cookie_setting=#{cookie_value};")
      end
    end
  end
end
RSpec.configure do |c|
  c.include ET3::Test::Cookies, type: :request
  c.include ET3::Test::Cookies, type: :feature
end
