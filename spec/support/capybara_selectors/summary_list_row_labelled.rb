Capybara.add_selector(:summary_list_row_labelled) do
  label "GOVUK summary list row labelled"
  xpath do |locator, _options|
    translated = ET3::Test::Messaging.instance.translate(locator)
    # Helps with nicer error messages from rspec etc..
    @definition.label("GOVUK summary list row labelled <#{translated}> (#{locator})")
    XPath.generate { |x| x.css('.govuk-summary-list__row')[x.child[x.attr(:class).contains_word('govuk-summary-list__key') & x.string.n.equals(translated)]] }
  end
end
