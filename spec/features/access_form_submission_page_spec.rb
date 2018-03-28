require 'rails_helper'

RSpec.feature "Access Form Submission Page", js: true do

  scenario "user will be able to read text" do
    form_submission_page.load

    expect(form_submission_page).to be_displayed

    expect(form_submission_page).to have_submission_confirmation
    expect(form_submission_page).to have_reference_number
    expect(form_submission_page).to have_download_pdf
  end

  scenario "user can navigate to the gov.uk homepage" do
    form_submission_page.load

    form_submission_page.finish

    expect(current_url).to eql 'https://www.gov.uk/'
  end

end
