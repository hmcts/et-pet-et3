require 'rails_helper'
RSpec.feature "Submit invalid office code", js: true do

  before do
    stub_invalid_office_code
  end

  scenario "shows the user an error page" do
    given_valid_data
    @respondent = FactoryBot.create(:respondent, :respondent_valid, case_number: '0254321/2018')

    respondents_details_page.load
    start_a_new_et3_response
    answer_respondents_details

    expect(respondents_details_page).to be_displayed
    expect(respondents_details_page.case_number_question).to have_error_office_invalid
  end

end
