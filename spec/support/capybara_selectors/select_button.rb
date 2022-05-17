Capybara.add_selector(:select_button) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.button.button-secondary') }
  end
end
