Capybara.add_selector(:table_row) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:tr)[x.child(:td)[x.string.n.is(translated)]] }
  end
end
