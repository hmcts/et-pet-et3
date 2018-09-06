require 'rails_helper'
RSpec.feature "Fill in Additional Information Page", js: true do
  include ET3::Test::I18n
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  before do
    stub_presigned_url_api_for_s3
  end

  scenario "correctly will enable user to continue to next page" do
    additional_information_page.load

    given_i_am(:company01)

    answer_upload_additional_information_question

    additional_information_page.next

    expect(confirmation_of_supplied_details_page).to be_displayed
  end

  scenario "incorrectly will provide errors" do
    pending("while we wait for a test environment to understand how the s3 bucket timings will work")
    fail
  end

  scenario "without uploading a file will not display 'Remove file' link on CoSD page" do
    additional_information_page.load
    additional_information_page.next

    expect(confirmation_of_supplied_details_page.confirmation_of_additional_information_answers).not_to have_link(t('components.confirmation_of_supplied_details.remove_file_link'), href: remove_rtf_path)
  end
end
