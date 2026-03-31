require 'rails_helper'

class AdditionalInformationModelClass < ApplicationRecord
  establish_connection adapter: :nulldb,
                       schema: 'config/nulldb_schema.rb'

  attribute :example_file, :gds_azure_file

  validates :example_file,
            additional_information_file: true
end

RSpec.describe AdditionalInformationFileValidator do
  describe '#valid?' do
    let(:example_base_api_url) { 'http://et-api.com' }
    let(:password_protected_message) { "This file is password protected. Upload a file that isn’t password protected." }
    let(:example_translations) do
      {
        activerecord: {
          errors: {
            models: {
              additional_information_model_class: {
                attributes: {
                  example_file: {
                    password_protected: password_protected_message
                  }
                }
              }
            }
          }
        }
      }
    end

    around do |example|
      original_et_api_url = ENV.fetch('ET_API_URL', nil)
      I18n.backend.store_translations I18n.locale, example_translations
      ENV['ET_API_URL'] = example_base_api_url
      example.run
      I18n.backend.reload!
      ENV['ET_API_URL'] = original_et_api_url
    end

    it 'adds API validation errors to the file attribute' do
      response_body = {
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
      stub_request(:post, "#{example_base_api_url}/validate").
        with(body: hash_including(command: 'ValidateAdditionalInformationFile')).
        to_return(status: 422, body: response_body.to_json, headers: { 'ContentType' => 'application/json' })

      model = AdditionalInformationModelClass.new(
        example_file: {
          'filename' => 'sample.rtf',
          'path' => '/tmp/sample.rtf',
          'content_type' => 'application/rtf'
        }
      )

      model.valid?

      expect(model.errors.where(:example_file, :password_protected)).to include(
        have_attributes(message: password_protected_message)
      )
    end
  end
end
