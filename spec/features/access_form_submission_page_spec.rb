require 'rails_helper'

RSpec.feature "Access Form Submission Page", js: true do

  before do
    stub_request(:post, "https://et-api-example.com/v2/repondents/response").
      with(headers: { content_type: 'application/json', 'Accept': 'application/json' }).
      to_return(
        headers: { content_type: 'application/json' },
        body:
          {
            "data": {
              "reference": "992000000100",
              "submitted_at": "2018-01-13 14:00",
              "pdf": "s3/link/to/form/pdf"
            }
          }.to_json,
        status: 201
      )
  end

  scenario "user will be able to read text" do
    given_i_am(:company01)
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to be_displayed

    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page).to have_reference_number
    expect(form_submission_page).to have_download_pdf
  end

  scenario "user can navigate to the gov.uk homepage" do
    given_i_am(:company01)
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    form_submission_page.return

    expect(current_url).to eql 'https://www.gov.uk/'
  end

end
