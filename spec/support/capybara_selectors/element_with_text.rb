Capybara.add_selector(:element_with_text) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant[x.string.n.is(translated)] }
  end
end
