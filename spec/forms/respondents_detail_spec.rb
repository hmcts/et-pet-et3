require 'rails_helper'

RSpec.describe RespondentsDetail, type: :model do

  it 'with case number only' do
    @respondent_detail = described_class.new(case_number: '7654321/2017')

    expect(@respondent_detail.case_number).to eql '7654321/2017'
  end

  it 'with name only' do
    @respondent_detail = described_class.new(name: 'dodgy_co')

    expect(@respondent_detail.name).to eql 'dodgy_co'
  end

  it 'with contact only' do
    @respondent_detail = described_class.new(contact: 'john')

    expect(@respondent_detail.contact).to eql 'john'
  end

  it 'with building_name only' do
    @respondent_detail = described_class.new(building_name: 'the_shard')

    expect(@respondent_detail.building_name).to eql 'the_shard'
  end
  
  it 'with street_name only' do
    @respondent_detail = described_class.new(street_name: 'downing_street')

    expect(@respondent_detail.street_name).to eql 'downing_street'
  end

  it 'with town only' do
    @respondent_detail = described_class.new(town: 'westminster')

    expect(@respondent_detail.town).to eql 'westminster'
  end

  it 'with postcode only' do
    @respondent_detail = described_class.new(postcode: 'wc1 1aa')

    expect(@respondent_detail.postcode).to eql 'wc1 1aa'
  end

  it 'with contact_preference only' do
    @respondent_detail = described_class.new(contact_preference: 'email')

    expect(@respondent_detail.contact_preference).to eql 'email'
  end

  it 'with email_address only' do
    @respondent_detail = described_class.new(email_address: 'john@dodgyco.com')

    expect(@respondent_detail.email_address).to eql 'john@dodgyco.com'
  end

  it 'with organisation_site_number only' do
    @respondent_detail = described_class.new(organisation_site_number: 1)

    expect(@respondent_detail.organisation_site_number).to be 1
  end
end
