require 'rails_helper'

RSpec.feature "Access Start Page", js: true do
  let(:respondents_details_page) { ET3::Test::RespondentsDetailsPage.new }

  scenario "user will be able to read text" do
    start_page.load

    expect(start_page).to be_displayed
    expect(start_page).to have_header
    expect(start_page).to have_introduction
  end

  scenario "user will be able to start form" do
    start_page.load

    start_page.next

    expect(respondents_details_page).to be_displayed
  end
end
