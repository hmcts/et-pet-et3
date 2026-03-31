require 'rails_helper'

RSpec.describe AdditionalInformation, type: :model do
  let(:example_base_api_url) { 'http://et-api.com' }
  let(:password_protected_message) { I18n.t('activerecord.errors.models.additional_information.attributes.upload_additional_information.password_protected') }
  let(:populated_additional_information) { build(:additional_information, :with_upload_additional_information) }

  around do |example|
    original_et_api_url = ENV.fetch('ET_API_URL', nil)
    ENV['ET_API_URL'] = example_base_api_url
    example.run
    ENV['ET_API_URL'] = original_et_api_url
  end

  describe '#valid?' do
    context 'when the uploaded file is accepted by the API' do
      before do
        stub_request(:post, "#{example_base_api_url}/validate").
          with(body: hash_including(command: 'ValidateAdditionalInformationFile')).
          to_return(status: 200, body: { status: 'accepted', uuid: SecureRandom.uuid, errors: [] }.to_json,
                    headers: { 'ContentType' => 'application/json' })
      end

      it 'does not add an error to upload_additional_information' do
        populated_additional_information.valid?

        expect(populated_additional_information.errors.where(:upload_additional_information)).to be_empty
      end
    end

    context 'when the uploaded file is rejected by the API' do
      before do
        stub_request(:post, "#{example_base_api_url}/validate").
          with(body: hash_including(command: 'ValidateAdditionalInformationFile')).
          to_return(status: 422, body: api_rejection_response.to_json, headers: { 'ContentType' => 'application/json' })
      end

      it 'adds the API error to upload_additional_information' do
        populated_additional_information.valid?

        expect(populated_additional_information.errors.where(:upload_additional_information, :password_protected)).to include(
          have_attributes(message: password_protected_message)
        )
      end
    end

    context 'when no file has been uploaded' do
      let(:blank_additional_information) { build(:additional_information) }

      it 'does not call the API' do
        blank_additional_information.valid?

        expect(a_request(:post, "#{example_base_api_url}/validate")).not_to have_been_made
      end

      it 'is valid' do
        expect(blank_additional_information).to be_valid
      end
    end
  end

  describe '.to_h' do
    it 'returns the upload_additional_information key and value pair' do
      expect(populated_additional_information.to_h).to include(
        upload_additional_information: populated_additional_information.upload_additional_information
      )
    end
  end

  def api_rejection_response
    {
      status: "not_accepted",
      uuid: "fbad7ec7-2da7-4e34-9509-d73c5e20ec72",
      errors: [
        {
          status: 422,
          code: "password_protected",
          title: "This file is password protected. Upload a file that isn't password protected.",
          detail: "This file is password protected. Upload a file that isn't password protected.",
          options: {},
          source: "/data_from_key",
          command: "ValidateAdditionalInformationFile",
          uuid: "fbad7ec7-2da7-4e34-9509-d73c5e20ec72"
        }
      ]
    }
  end
end
