require_relative '../sections'
require_relative '../messaging'
module ET3
  module Test
    class BasePage < ::SitePrism::Page
      def self.set_url(url)
        super "#{ENV['ET3_URL']}{/locale}#{url}"
      end

      element :google_tag_manager_head_script, :xpath, XPath.generate {|x| x.css('head script')[x.string.n.contains("googletagmanager")]}, visible: false
      element :google_tag_manager_body_noscript, :xpath, XPath.generate {|x| x.css('body noscript')[x.child(:iframe)[x.attr(:src).contains('googletagmanager')]]}

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

      def has_google_tag_manager_sections_for?(account)
        google_tag_manager_head_script.native.inner_html.include?(account) &&
            google_tag_manager_body_noscript.native.inner_html.include?(account)
      end

      def has_no_google_tag_manager_sections?
        has_no_google_tag_manager_head_script? && has_no_google_tag_manager_body_noscript?
      end
    end
  end
end
