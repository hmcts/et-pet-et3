Capybara.add_selector(:save_and_return_number_panel) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('.govuk-inset-text')[x.child(:p)[x.string.n.is(translated)]] }
  end
end
