module ET3
  module Test
    class PrivacyNoticePage < BasePage
      set_url '/privacy'
      section :switch_language, LanguageSwitcherSection, '.switch-language'

      element :header, :content_header, 'privacy_notice.header'

      element :introduction, :element_with_text, 'privacy_notice.introduction'

      section :who_manages, :wrapper_headered, 'privacy_notice.who_manages.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.who_manages.header'
        def assert_content
          t('privacy_notice.who_manages.content',
            personal_info_charter_href: t('links.footer.personal_info_charter_href')
          ).each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :personal_data, :wrapper_headered, 'privacy_notice.personal_data.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.personal_data.header'
        def assert_content
          t('privacy_notice.personal_data.content', using_cookies_href: t('links.footer.using_cookies_href')).each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Array
              translated_element.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end
      end

      section :what_we_do_data, :wrapper_headered, 'privacy_notice.what_we_do_data.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.what_we_do_data.header'
        def assert_content
          t('privacy_notice.what_we_do_data.content').each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Array
              translated_element.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end
      end

      section :your_rights, :wrapper_headered, 'privacy_notice.your_rights.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.your_rights.header'
        def assert_content
          t('privacy_notice.your_rights.content').each do |translated_element|
            case translated_element
            when String
            root_element.assert_selector('p', text: translated_element)
            when Array
              translated_element.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end
      end

      section :sharing_your_data, :wrapper_headered, 'privacy_notice.sharing_your_data.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.sharing_your_data.header'
        def assert_content
          root_element.assert_selector('p', text: t('privacy_notice.sharing_your_data.content',
                                       terms_and_conditions_href: t('links.footer.terms_and_conditions_href')))
        end
      end

      section :receiving_notifications, :wrapper_headered, 'privacy_notice.receiving_notifications.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.receiving_notifications.header'
        def assert_content
          t('privacy_notice.receiving_notifications.content',
            contact_us_href: t('links.footer.contact_us_href')
          ).each do |translated_element|
            root_element.assert_selector('p', text: translated_element)
          end
        end
      end

      section :how_to_complain, :wrapper_headered, 'privacy_notice.how_to_complain.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'privacy_notice.how_to_complain.header'
        def assert_content
          t('privacy_notice.how_to_complain.content',
            ico_href: t('links.footer.ico_href')
          ).each do |translated_element|
            root_element.assert_selector('p', text: translated_element)
          end
        end
      end

      def switch_to_welsh
        switch_language.welsh_link.click
      end

      def switch_to_english
        switch_language.english_link.click
      end
    end
  end
end
