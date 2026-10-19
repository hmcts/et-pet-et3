require 'rails_helper'

RSpec.describe EtApiHandler do

  it 'submits with missing address_attributes' do
    stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.localhost:3100/api/v2')}/respondents/build_response").
      with(headers: { 'Content-Type': 'application/json', Accept: 'application/json' }).
      to_return(
        headers: { 'Content-Type': 'application/json' },
        body: {
          "status" => "not_accepted",
          "uuid" => "587509f6-b1eb-4b63-b9d4-e3468fd12b61",
          "errors" => [
            {
              "status" => 422,
              "code" => "invalid_address",
              "title" => "Invalid address",
              "detail" => "Invalid address",
              "options" => {},
              "source" => "/data/2/address_attributes",
              "command" => "BuildRepresentative",
              "uuid" => "4b2fb7d1-5289-49b9-a5df-d5d14f46a5b2"
            }
          ]
        }.to_json,
        status: 400
      )

    full_hash = {}
    result = described_class.submit(full_hash)
    expect(result.valid?).to be false
    expect(result.errors.where('your_representatives_details_answers/address_attributes').length).to be 1
    expect(result.errors.where('your_representatives_details_answers/address_attributes').first)
      .to have_attributes attribute: :'your_representatives_details_answers/address_attributes',
                          type: 'invalid_address',
                          options: hash_including(message: 'Invalid address')
  end

  it 'submits with missing case number' do
    stub_request(:post, "#{ENV.fetch('ET_API_URL', 'http://api.localhost:3100/api/v2')}/respondents/build_response").
      with(headers: { 'Content-Type': 'application/json', Accept: 'application/json' }).
      to_return(
        headers: { 'Content-Type': 'application/json' },
        body: {
          "status" => "not_accepted",
          "uuid" => "587509f6-b1eb-4b63-b9d4-e3468fd12b61",
          "errors" => [
            {
              "status" => 422,
              "code" => "invalid_address",
              "title" => "Invalid case number",
              "detail" => "Invalid case number",
              "options" => {},
              "source" => "/data/0/case_number",
              "command" => "BuildResponse",
              "uuid" => "4b2fb7d1-5289-49b9-a5df-d5d14f46a5b2"
            }
          ]
        }.to_json,
        status: 400
      )

    full_hash = {}
    result = described_class.submit(full_hash)
    expect(result.valid?).to be false
    expect(result.errors.where('respondents_detail_answers/case_number').length).to be 1
    expect(result.errors.where('respondents_detail_answers/case_number').first)
      .to have_attributes attribute: :'respondents_detail_answers/case_number',
                          type: 'invalid_address',
                          options: hash_including(message: 'Invalid case number')

  end
end
