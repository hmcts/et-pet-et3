require 'rails_helper'
RSpec.feature "Fill in Additional Information Page", :js do
  include ET3::Test::I18n
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  context "when uploading to azure" do
    before do
      stub_create_blob_to_azure
    end

    before do
      given_valid_user
      start_a_new_et3_response
      registration_start
    end

    scenario "correctly will enable user to continue to next page" do
      additional_information_page.load(locale: current_locale_parameter)
      given_valid_data
      answer_additional_information
      expect(confirmation_of_supplied_details_page).to be_displayed
    end

    scenario "without uploading a file will not display 'Remove file' link on CoSD page" do
      additional_information_page.load(locale: current_locale_parameter)
      additional_information_page.next
      expect(confirmation_of_supplied_details_page.confirmation_of_additional_information_answers.upload_additional_information_row).to have_no_remove_file_link
    end

    scenario "correctly will enable you to remove a file that is already loaded" do
      additional_information_page.load(locale: current_locale_parameter)
      given_valid_data
      answer_additional_information
      additional_information_page.load(locale: current_locale_parameter)
      expect(additional_information_page).to have_button(t('components.confirmation_of_supplied_details.remove_file_link'))
    end
  end
end
