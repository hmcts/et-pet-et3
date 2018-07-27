Capybara.add_selector(:table_row_with_td_labelled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:tr)[x.child(:td)[x.string.n.is(translated)]] }
  end
end
