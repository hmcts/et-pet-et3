require_relative '../sections'
require_relative '../messaging'
module ET3
  module Test
    class BasePage < ::SitePrism::Page
      def self.set_url(url)
        super "#{ENV['ET3_URL']}#{url}"
      end
      # Populate
    end
  end
end
