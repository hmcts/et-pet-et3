Capybara.add_selector(:form_labelled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate { |x| x.descendant(:label)[x.string.n.is(translated)] }
  end
end