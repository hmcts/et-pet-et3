require_relative '../sections'
require_relative '../messaging'
module ET3
  module Test
    class BasePage < ::SitePrism::Page
      def self.set_url(url)
        super "#{ENV['ET3_URL']}#{url}"
      end

      section :sidebar, :sidebar_titled, 'components.sidebar.header' do
        element :claim_link, :link_named, 'components.sidebar.claim_link'
        element :response_link, :link_named, 'components.sidebar.response_link'
        element :contact_link, :link_named, 'components.sidebar.contact_link'
        element :download_link, :link_named, 'components.sidebar.download_link'
        element :more_category_link, :link_named, 'components.sidebar.more_category_link'
      end

      def js_severe_errors
        return [] unless page.driver.try(:browser).try(:browser) == :chromedriver
        errors = page.driver.browser.manage.logs.get(:browser).select { |error| error.level == "SEVERE" }
        errors.map do |error|
          { message: error.message }
        end
      end

    end
  end
end
