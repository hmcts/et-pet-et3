Capybara.add_selector(:inputtext_labelled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate do |x|
      xpath = x.descendant(:input)[x.attr(:type).equals('text')]
      locate_xpath = xpath[x.attr(:id).equals(x.anywhere(:label)[x.string.n.is(translated)].attr(:for))]
      locate_xpath = locate_xpath.union(x.descendant(:label)[x.string.n.is(translated)].descendant(xpath))
      locate_xpath
    end
  end
end
