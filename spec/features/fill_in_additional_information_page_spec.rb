require 'rails_helper'
RSpec.feature "Fill in Additional Information Page", js: true do
  include ET3::Test::I18n
  let(:confirmation_of_supplied_details_page) { ET3::Test::ConfirmationOfSuppliedDetailsPage.new }

  context "when uploading to azure" do
    before do
      stub_build_blob_to_azure
    end

    let(:keys_in_container) { ET3::Test::AzureHelpers.keys_in_container }

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

    scenario "correctly will leave a file in the storage container" do
      additional_information_page.load(locale: current_locale_parameter)
      given_valid_data
      answer_additional_information

      expect(keys_in_container).to include Store.last.hash_store[:additional_information_answers][:upload_additional_information]
    end

    scenario "correctly will enable you to remove a file that is already loaded" do
      additional_information_page.load(locale: current_locale_parameter)
      given_valid_data
      answer_additional_information
      additional_information_page.load(locale: current_locale_parameter)
      expect(additional_information_page).to have_link(t('components.confirmation_of_supplied_details.remove_file_link'))
    end
  end
end
