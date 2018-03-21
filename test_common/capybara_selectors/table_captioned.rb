Capybara.add_selector(:table_captioned) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.css('table')[x.descendant(:caption)[x.string.n.is(translated)]] }
  end
end
