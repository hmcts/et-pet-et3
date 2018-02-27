require 'rails_helper'
RSpec.feature "Fill in Respondents Details Page", js: true do
  let(:claimants_details_page) { ET3::Test::ClaimantsDetailsPage.new }

  scenario "correctly will enable user to continue to next page" do
    respondents_details_page.load

    given_i_am(:company01)

    answer_case_number_question
    answer_name_question
    answer_contact_question
    answer_building_name_question
    answer_street_question
    answer_town_question
    answer_postcode_question
    answer_contact_preference_question
    answer_organisation_more_than_one_site_question

    respondents_details_page.next

    expect(claimants_details_page).to be_displayed
  end
end
