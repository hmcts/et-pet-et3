require 'rails_helper'

RSpec.feature "Access Start Page", js: true do
  let(:respondents_details_page) { ET3::Test::RespondentsDetailsPage.new }

  scenario "user will be able to read text" do
    start_page.load(locale: current_locale_parameter)

    expect(start_page).to have_header
    expect(start_page).to have_description

    expect(start_page.what_you_need).to have_header
    expect(start_page.what_you_need).to have_bullet_one
    expect(start_page.what_you_need).to have_bullet_two
    expect(start_page.what_you_need).to have_bullet_three
    expect(start_page.what_you_need).to have_bullet_four
    expect(start_page.what_you_need).to have_bullet_five
    expect(start_page.what_you_need).to have_bullet_six

    expect(start_page.how_to_fill).to have_header
    expect(start_page.how_to_fill).to have_bullet_one
    expect(start_page.how_to_fill).to have_bullet_two
    expect(start_page.how_to_fill).to have_bullet_three

    expect(start_page.dpa).to have_header
    expect(start_page.dpa).to have_section_content

    expect(start_page).to have_start_button
  end

  scenario "user will be able to start form" do
    start_page.load(locale: current_locale_parameter)
    start_page.next

    expect(respondents_details_page).to be_displayed
  end
end
