Given(/^I am on the ET3 landing page$/) do
  start_page.load
  expect(start_page).to be_displayed
  expect(start_page).to have_header
  expect(start_page).to have_introduction
end

Then(/^I should see a list for what you need for this form$/) do
  #   TODO waiting on data-behavior tag
end

Then(/^I should see a list for how to fill in the form$/) do
  #   TODO waiting on data-behavior tag
end

Then(/^I should see information about data Protection Act 1998$/) do
  #   TODO waiting on data-behavior tag
end

When(/^I click on the begin this form button$/) do
  start_page.next
end

Then(/^I should be taken to the respondents details page$/) do
  expect(respondents_details_page).to be_displayed
end
