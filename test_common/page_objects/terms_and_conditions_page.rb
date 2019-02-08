module ET3
  module Test
    class TermsAndConditionsPage < BasePage
      set_url '/terms'
      section :switch_language, '.switch-language' do
        include ::ET3::Test::I18n
        element :language, :link_named, 'switch.language'
        element :welsh_link, :link_or_button, t('switch.language', locale: :en)
        element :english_link, :link_or_button, t('switch.language', locale: :cy)
      end

      element :header, :content_header, 'terms_and_conditions.header'

      element :general_terms_link, :link_named, 'terms_and_conditions.general_terms_link'
      element :applicable_law_link, :link_named, 'terms_and_conditions.applicable_law_link'
      element :responsible_use_link, :link_named, 'terms_and_conditions.responsible_use_link'
      element :gdpr_link, :link_named, 'terms_and_conditions.gdpr_link'
      element :hmcts_notice_link, :link_named, 'terms_and_conditions.hmcts_notice_link'
      element :disclaimer_link, :link_named, 'terms_and_conditions.disclaimer_link'

      element :introduction, :element_with_text, 'terms_and_conditions.introduction'

      section :general_terms, :wrapper_headered, 'terms_and_conditions.general_terms.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.general_terms.header'
        def assert_content
          t('terms_and_conditions.general_terms.content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :applicable_law, :wrapper_headered, 'terms_and_conditions.applicable_law.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.applicable_law.header'
        def assert_content
          t('terms_and_conditions.applicable_law.content').each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Hash
              translated_element.values.flatten.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end
      end

      section :responsible_use, :wrapper_headered, 'terms_and_conditions.responsible_use.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.responsible_use.header'
        def assert_content
          t('terms_and_conditions.responsible_use.content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :gdpr, :wrapper_headered, 'terms_and_conditions.gdpr.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.gdpr.header'
        def assert_content
          t('terms_and_conditions.gdpr.content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end
      end

      section :hmcts_notice, :wrapper_headered, 'terms_and_conditions.hmcts_notice.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.hmcts_notice.header'

        element :purpose_header, :element_with_text, 'terms_and_conditions.hmcts_notice.purpose_header'
        def assert_purpose_content
          t('terms_and_conditions.hmcts_notice.purpose_content',
            purpose_content_href: t('terms_and_conditions.hmcts_notice.purpose_content_href')).each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end

        element :about_personal_data_header, :element_with_text, 'terms_and_conditions.hmcts_notice.about_personal_data_header'
        def assert_about_personal_data_content
          t('terms_and_conditions.hmcts_notice.about_personal_data_content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end

        element :personal_data_collect_header, :element_with_text, 'terms_and_conditions.hmcts_notice.personal_data_collect_header'
        def assert_personal_data_collect_content
          t('terms_and_conditions.hmcts_notice.personal_data_collect_content').each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Hash
              translated_element.values.flatten.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end

        element :personal_data_use_header, :element_with_text, 'terms_and_conditions.hmcts_notice.personal_data_use_header'
        def assert_personal_data_use_content
          t('terms_and_conditions.hmcts_notice.personal_data_use_content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end

        element :non_personal_use_header, :element_with_text, 'terms_and_conditions.hmcts_notice.non_personal_use_header'
        def assert_non_personal_use_content
          t('terms_and_conditions.hmcts_notice.non_personal_use_content').each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Hash
              translated_element.values.flatten.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end

        element :personal_data_stored_header, :element_with_text, 'terms_and_conditions.hmcts_notice.personal_data_stored_header'
        def assert_personal_data_stored_content
          t('terms_and_conditions.hmcts_notice.personal_data_stored_content',
            aws_href: t('terms_and_conditions.hmcts_notice.aws_href'),
            sendgrid_href: t('terms_and_conditions.hmcts_notice.sendgrid_href')).each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end

        element :non_personal_data_stored_header, :element_with_text, 'terms_and_conditions.hmcts_notice.non_personal_data_stored_header'
        def assert_non_personal_data_stored_content
          root_element.assert_selector('p', text:
              t('terms_and_conditions.hmcts_notice.non_personal_data_stored_content',
                ga_href:t('terms_and_conditions.hmcts_notice.ga_href')))
        end

        element :data_secure_header, :element_with_text, 'terms_and_conditions.hmcts_notice.data_secure_header'
        def assert_data_secure_content
          root_element.assert_selector('p', text: t('terms_and_conditions.hmcts_notice.data_secure_content'))
        end

        element :disclosing_data_header, :element_with_text, 'terms_and_conditions.hmcts_notice.disclosing_data_header'
        def assert_disclosing_data_content
          root_element.assert_selector('p', text: t('terms_and_conditions.hmcts_notice.disclosing_data_content'))
        end

        element :manage_sessions_header, :element_with_text, 'terms_and_conditions.hmcts_notice.manage_sessions_header'
        def assert_manage_sessions_content
          t('terms_and_conditions.hmcts_notice.manage_sessions_content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
          end
        end

        element :access_personal_info_header, :element_with_text, 'terms_and_conditions.hmcts_notice.access_personal_info_header'
        def assert_access_personal_info_content
          root_element.assert_selector('p', text: t('terms_and_conditions.hmcts_notice.access_personal_info_content',
                                                    data_access_email: t('terms_and_conditions.hmcts_notice.data_access_email')))
        end

        element :more_details_header, :element_with_text, 'terms_and_conditions.hmcts_notice.more_details_header'
        def assert_more_details_content
          t('terms_and_conditions.hmcts_notice.more_details_content').each do |translated_element|
            case translated_element
            when String
              root_element.assert_selector('p', text: translated_element)
            when Hash
              translated_element.values.flatten.each do |translated_bullet_point|
                root_element.assert_selector('li', text: translated_bullet_point)
              end
            end
          end
        end

        element :make_complaint_header, :element_with_text, 'terms_and_conditions.hmcts_notice.make_complaint_header'
        def assert_make_complaint_content
          root_element.assert_selector('p', text: t('terms_and_conditions.hmcts_notice.make_complaint_content',
                                                  data_compliance_email: t('terms_and_conditions.hmcts_notice.data_compliance_email')))
        end

        element :complaints_header, :element_with_text, 'terms_and_conditions.hmcts_notice.complaints_header'
        def assert_complaints_content
          root_element.assert_selector('p', text: t('terms_and_conditions.hmcts_notice.complaints_text')) &&
          t('terms_and_conditions.hmcts_notice.complaints_address', ico_href: t('terms_and_conditions.hmcts_notice.ico_href')).each do |translated_address_line|
            root_element.assert_selector('em', text: translated_address_line)
          end
        end
      end

      section :disclaimer, :wrapper_headered, 'terms_and_conditions.disclaimer.header'do
        include ET3::Test::I18n
        element :header, :element_with_text, 'terms_and_conditions.disclaimer.header'
        def assert_content
          t('terms_and_conditions.disclaimer.content').each do |translated_paragraph|
            root_element.assert_selector('p', text: translated_paragraph)
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
