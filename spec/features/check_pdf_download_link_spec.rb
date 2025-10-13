require 'rails_helper'

RSpec.feature "Check PDF Download Link", :js do

  # Upon ET3 submission to API, the API generates a PDF version of the ET3 form it just received.
  # In the API's response to ET3's submission, it returns a URL for this PDF. However, due to
  # the asynchronous nature of the PDF generation and API response, the file may not be ready
  # by the time an ET3 user sees the form submission page.
  #
  # As such, upon the form submission page loading, ET3 has a javascript function which checks
  # whether the PDF link is valid. If it is invalid, it disables the link and changes the text
  # displayed to the user. It will then check the link every 10 seconds until the link is
  # valid.
  #
  # This spec tests this functionality by using Cuprite's network interception to simulate
  # the PDF not being ready on the first request, then becoming available on subsequent requests.

  let(:pdf_url) { "http://example.com/test/response.pdf" }

  before do
    # Reset Capybara session to avoid session pollution between scenarios
    Capybara.reset_sessions!
    stub_submission_with_pdf_url(pdf_url)
    stub_create_blob_to_azure
  end

  def setup_pdf_network_interception(first_request_fails: true)
    request_count = 0

    page.driver.browser.network.intercept

    page.driver.browser.on(:request) do |request|
      if request.url.include?("example.com/test/response.pdf")
        request_count += 1

        if first_request_fails && request_count == 1
          # First request: return 404 Not Found
          request.abort
        else
          # Subsequent requests or if first_request_fails is false: return 200 OK
          request.respond(
            status: 200,
            headers: { "Content-Type" => "application/pdf" },
            body: ""
          )
        end
      else
        request.continue
      end
    end
  end

  def stub_submission_with_pdf_url(url)
    stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api/v2')}/respondents/build_response").
      with(headers: { 'Content-Type': 'application/json', Accept: 'application/json' }).
      to_return(
        headers: { 'Content-Type': 'application/json' },
        body: {
          meta: {
            BuildResponse: {
              reference: "142000000100",
              submitted_at: "2018-01-13 14:00",
              pdf_url: url,
              office_address: "Alexandra House, 14-22 The Parsonage, Manchester, M3 2JA",
              office_phone_number: "0161 833 6100"
            }
          }
        }.to_json
      )
  end

  scenario "link will be disabled as first request will not be valid" do
    setup_pdf_network_interception(first_request_fails: true)

    given_valid_user
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page).to have_invalid_pdf_download
  end

  scenario "link will be enabled as second request will be valid" do
    setup_pdf_network_interception(first_request_fails: true)

    given_valid_user
    given_valid_data
    start_a_new_et3_response
    registration_start
    answer_respondents_details
    answer_claimants_details
    answer_earnings_and_benefits
    answer_defend_claim_question
    answer_representative
    answer_disability_question
    answer_employers_contract_claim
    answer_additional_information
    answer_confirmation_of_supplied_details

    expect(form_submission_page).to have_invalid_pdf_download
    expect(form_submission_page).to have_valid_pdf_download
  end

end
