Capybara.add_selector(:link_named) do
  label 'Link named'
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    @definition.label("Link named <#{translated}> (#{locator})")
    XPath.generate { |x| x.descendant(:a)[x.string.n.is(translated)] }
  end
end
