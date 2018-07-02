module ET3
  module Test
    class NotFoundPage < BasePage
      include ET3::Test::I18n

      element :header, :css, :div, text: t('page_content.not_found_page.header')

      element :subheader, :css, :div, text: t('page_content.not_found_page.subheader')
         
      element :paragraph1, :css, :p, text: t('page_content.not_found_page.paragraph1')

      element :paragraph2, :css, :p, text: t('page_content.not_found_page.link')
    end
  end
end