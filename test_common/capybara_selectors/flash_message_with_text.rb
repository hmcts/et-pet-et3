Capybara.add_selector(:flash_message_with_text) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:h2)[x.ancestor(:div)[x.attr(:class).contains('flash').and(x.string.equals(translated))]] }
  end
end