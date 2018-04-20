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

end
