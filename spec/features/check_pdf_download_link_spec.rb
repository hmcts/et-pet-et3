require 'rails_helper'

RSpec.feature "Check PDF Download Link", js: true do

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
  end

  scenario "link will be disabled as first request will not be valid" do
    given_i_am(:company01)
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to have_invalid_pdf_download
  end

  scenario "link will be enabled as second request will be valid" do
    given_i_am(:company01)
    answer_all_questions
    confirmation_of_supplied_details_page.submit_form

    expect(form_submission_page).to have_invalid_pdf_download
    expect(form_submission_page).to have_valid_pdf_download
  end

end
