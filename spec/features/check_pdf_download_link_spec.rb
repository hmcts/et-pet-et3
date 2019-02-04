require 'rails_helper'

RSpec.feature "Check PDF Download Link", js: true do

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
  # This spec test this functionality, therefore it uses a special stub which returns a pdf
  # URL of '/test/pdf-download'. This utilises the controller below to return an invalid
  # link the first time of asking and a valid one thereafter.

  class PdfDownloadLinkController < ActionController::Base
    def show
      session[:hit_count] ||= 0
      if session[:hit_count] > 0
        logger.debug 'Session count > 0'
        head :ok
      else
        logger.debug 'Session count =< 0'
        head :not_found
      end
      session[:hit_count] += 1
    end
  end

  before do
    Rails.application.routes.append do
      get 'test/pdf-download' => 'pdf_download_link#show'
    end
    Rails.application.reload_routes!
  end

  before do
    stub_submission_with_custom_pdf_download_link
    stub_presigned_url_api_for_s3
    stub_valid_office_code
  end

  scenario "link will be disabled as first request will not be valid" do
    given_valid_data
    start_a_new_et3_response
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
    given_valid_data
    start_a_new_et3_response
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
