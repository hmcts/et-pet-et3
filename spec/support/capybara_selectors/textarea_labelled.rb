Capybara.add_selector(:textarea_labelled) do
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    XPath.generate do |x|
      xpath = x.descendant(:textarea)
      locate_xpath = xpath[x.attr(:id).equals(x.anywhere(:label)[x.string.n.starts_with(translated)].attr(:for))]
      locate_xpath = locate_xpath.union(x.descendant(:label)[x.string.n.starts_with(translated)].descendant(xpath))
      locate_xpath
    end
  end
end
