module ET3
  module Test
    class LanguageSwitcherSection < BaseSection
      include ::ET3::Test::I18n
      element :language, :link_named, 'switch.language'
      element :welsh_link, :link_or_button, t('switch.language', locale: :en)
      element :english_link, :link_or_button, t('switch.language', locale: :cy)
    end
  end
end
