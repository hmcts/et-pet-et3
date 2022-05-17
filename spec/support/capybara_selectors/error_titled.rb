Capybara.add_selector(:error_titled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:div)[x.child(:h2)[x.string.n.is(translated)]] }
  end
end
