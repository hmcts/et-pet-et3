require 'rails_helper'
RSpec.feature "Fill in Confirmation of Supplied Details Page", js: true do
  let(:form_submission_page) { ET3::Test::FormSubmissionPage.new }

  scenario "correctly will enable user to continue to next page" do
    confirmation_of_supplied_details_page.load

    given_i_am(:company01)

    answer_email_receipt_question
    answer_confirm_email_receipt_question

    expect(confirmation_of_supplied_details_page).to have_confirmation_of_respondents_details_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_claimants_details_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_earnings_and_benefits_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_response_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_your_representative_answers
    expect(confirmation_of_supplied_details_page).to have_confirmation_of_employer_contract_claim_answers

    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to be_displayed
  end
end
