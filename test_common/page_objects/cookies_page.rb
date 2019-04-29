module ET3
  module Test
    class CookiesPage < BasePage
      set_url '/cookies'
      section :switch_language, LanguageSwitcherSection, '.switch-language'

      element :header, :content_header, 'cookies.header'

      section :introduction, :wrapper_headered, 'cookies.introduction' do
        include ET3::Test::I18n

        def assert_content
          t('cookies.introduction_bullets', managing_cookies_href:
              t('links.footer.managing_cookies_href')).each do |translated_element|
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

      element :cookies_used_subheader, :element_with_text, 'cookies.subheader'

      section :website_usage, :wrapper_headered, 'cookies.website_usage.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'cookies.website_usage.header'
        def assert_content
          t('cookies.website_usage.content',
            google_privacy_policy_href: t('links.footer.google_privacy_policy_href'),
            opt_out_href: t('links.footer.opt_out_href')
          ).each do |translated_element|
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
        def assert_table
          t('cookies.website_usage.table').each do |translated_row|
            translated_row.each do |translated_cell|
              root_element.assert_selector('td', text: translated_cell)
            end
          end
        end
      end

      section :introductory_message, :wrapper_headered, 'cookies.introductory_message.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'cookies.introductory_message.header'
        def assert_content
          root_element.assert_selector('p', text: t('cookies.introductory_message.content'))
        end
        def assert_table
          root_element.assert_selector('td', text: t('cookies.introductory_message.table.name')) &&
          root_element.assert_selector('td', text: t('cookies.introductory_message.table.purpose')) &&
          root_element.assert_selector('td', text: t('cookies.introductory_message.table.expires'))
        end
      end

      section :store_answers, :wrapper_headered, 'cookies.store_answers.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'cookies.store_answers.header'
        def assert_content
          root_element.assert_selector('p', text: t('cookies.store_answers.content'))
        end
        def assert_table
          root_element.assert_selector('td', text: t('cookies.store_answers.table.name')) &&
          root_element.assert_selector('td', text: t('cookies.store_answers.table.purpose')) &&
          root_element.assert_selector('td', text: t('cookies.store_answers.table.expires'))
        end
      end

      section :more_secure, :wrapper_headered, 'cookies.more_secure.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'cookies.more_secure.header'
        def assert_content
          root_element.assert_selector('p', text: t('cookies.more_secure.content'))
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
