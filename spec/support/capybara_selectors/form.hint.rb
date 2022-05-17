Capybara.add_selector(:form_hint) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.form-hint')[x.string.n.is(translated)] }
  end
end