require 'rails_helper'
RSpec.feature "Fill in Confirmation of Supplied Details Page", js: true do
  let(:form_submission_page) { ET3::Test::FormSubmissionPage.new }

  before do
    stub_et_api
  end

  scenario "correctly will enable user to continue to next page" do
    given_i_am(:company01)
    answer_all_questions

    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    given_i_am(:erroneously_entering_data_on_confirmation_of_supplied_details_page)

    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(confirmation_of_supplied_details_page).to have_error_header
    expect(confirmation_of_supplied_details_page.email_receipt_question).to have_error_invalid
  end
end
