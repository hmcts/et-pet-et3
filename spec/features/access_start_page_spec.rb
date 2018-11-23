require 'rails_helper'

RSpec.feature "Access Start Page", js: true do
  let(:respondents_details_page) { ET3::Test::RespondentsDetailsPage.new }

  scenario "user will be able to read text" do
    start_page.load(locale: current_locale_parameter)

    expect(start_page).to be_displayed
  end

  scenario "user will be able to start form" do
    start_page.load(locale: current_locale_parameter)

    start_page.next

    expect(respondents_details_page).to be_displayed
  end
end
