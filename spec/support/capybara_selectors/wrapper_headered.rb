Capybara.add_selector(:wrapper_headered) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:div)[x.child[x.string.n.is(translated)]] }
  end
end
