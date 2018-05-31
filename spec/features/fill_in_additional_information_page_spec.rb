require 'rails_helper'
RSpec.feature "Fill in Additional Information Page", js: true do
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

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
end
