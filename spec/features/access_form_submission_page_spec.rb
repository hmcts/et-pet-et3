require 'rails_helper'

RSpec.feature "Access Form Submission Page", js: true do

  before do
    stub_et_api
    stub_presigned_url_api_for_s3
  end

  scenario "user will be able to read text" do
    given_i_am
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to be_displayed

    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page).to have_reference_number
    expect(form_submission_page).to have_valid_pdf_download
  end

  scenario "user can navigate to the gov.uk homepage" do
    given_i_am
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    form_submission_page.return

    expect(current_url).to eql 'https://www.gov.uk/'
  end

end
