Capybara.add_selector(:paragraph_with_text) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:p)[x.string.n.is(translated)] }
  end
end
