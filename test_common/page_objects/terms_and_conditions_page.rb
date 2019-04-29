module ET3
  module Test
    class TermsAndConditionsPage < BasePage
      set_url '/terms'
      section :switch_language, LanguageSwitcherSection, '.switch-language'

      element :header, :content_header, 'terms_and_conditions.header'

      element :introduction, :element_with_text, 'terms_and_conditions.introduction'

      section :who_we_are, :wrapper_headered, 'terms_and_conditions.who_we_are.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.who_we_are.header'
        def assert_content
          t('terms_and_conditions.who_we_are.content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :info_provided, :wrapper_headered, 'terms_and_conditions.info_provided.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.info_provided.header'
        def assert_content
          t('terms_and_conditions.info_provided.content').each do |translated_paragraph|
                root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :sharing_storing_data, :wrapper_headered, 'terms_and_conditions.sharing_storing_data.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.sharing_storing_data.header'
        def assert_content
          root_element.assert_selector('p', text: t('terms_and_conditions.sharing_storing_data.content',
                                                    privacy_policy_href: t('links.footer.privacy_policy_href'),
                                                    cookie_policy_href: t('links.footer.cookie_policy_href')
          ))
        end
      end

      section :laws_applied, :wrapper_headered, 'terms_and_conditions.laws_applied.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.laws_applied.header'
        def assert_content
          t('terms_and_conditions.laws_applied.content').each do |translated_element|
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

      section :how_to_use, :wrapper_headered, 'terms_and_conditions.how_to_use.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.how_to_use.header'
        def assert_content
          t('terms_and_conditions.how_to_use.content').each do |translated_element|
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

      section :entering_sensitive_info, :wrapper_headered, 'terms_and_conditions.entering_sensitive_info.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.entering_sensitive_info.header'
        def assert_content
          t('terms_and_conditions.entering_sensitive_info.content',
            privacy_policy_href: t('links.footer.privacy_policy_href')
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
      end

      section :disclaimer, :wrapper_headered, 'terms_and_conditions.disclaimer.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.disclaimer.header'
        def assert_content
          t('terms_and_conditions.disclaimer.content',
            contact_us_href: t('links.footer.contact_us_href')
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
