Capybara.add_selector(:content_header) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:h2)[x.string.n.is(translated)] }
  end
end
