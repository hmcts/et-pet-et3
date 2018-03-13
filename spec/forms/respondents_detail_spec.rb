require 'rails_helper'

RSpec.describe RespondentsDetail, type: :model do

  context 'when correctly populated' do

    it 'with case number only' do
      respondent_detail = described_class.new(case_number: '7654321/2017')

      expect(respondent_detail.case_number).to eql '7654321/2017'
    end

    it 'with name only' do
      respondent_detail = described_class.new(name: 'dodgy_co')

      expect(respondent_detail.name).to eql 'dodgy_co'
    end

    it 'with contact only' do
      respondent_detail = described_class.new(contact: 'john')

      expect(respondent_detail.contact).to eql 'john'
    end

    it 'with building_name only' do
      respondent_detail = described_class.new(building_name: 'the_shard')

      expect(respondent_detail.building_name).to eql 'the_shard'
    end

    it 'with street_name only' do
      respondent_detail = described_class.new(street_name: 'downing_street')

      expect(respondent_detail.street_name).to eql 'downing_street'
    end

    it 'with town only' do
      respondent_detail = described_class.new(town: 'westminster')

      expect(respondent_detail.town).to eql 'westminster'
    end

    it 'with county only' do
      respondent_detail = described_class.new(county: 'greater london')

      expect(respondent_detail.county).to eql 'greater london'
    end

    it 'with postcode only' do
      respondent_detail = described_class.new(postcode: 'wc1 1aa')

      expect(respondent_detail.postcode).to eql 'wc1 1aa'
    end

    it 'with DX number only' do
      respondent_detail = described_class.new(dx_number: '123456')

      expect(respondent_detail.dx_number).to eql '123456'
    end

    it 'with contact number only' do
      respondent_detail = described_class.new(contact_number: '0207 123 4567')

      expect(respondent_detail.contact_number).to eql '0207 123 4567'
    end

    it 'with mobile number only' do
      respondent_detail = described_class.new(mobile_number: '07123456789')

      expect(respondent_detail.mobile_number).to eql '07123456789'
    end

    it 'with contact_preference only' do
      respondent_detail = described_class.new(contact_preference: 'email')

      expect(respondent_detail.contact_preference).to eql 'email'
    end

    it 'with email_address only' do
      respondent_detail = described_class.new(email_address: 'johndodgyco.com')

      expect(respondent_detail.email_address).to eql 'johndodgyco.com'
    end

    it 'with fax number only' do
      respondent_detail = described_class.new(fax_number: '0207 123 4567')

      expect(respondent_detail.fax_number).to eql '0207 123 4567'
    end

    it 'with organisation_more_than_one_site only' do
      respondent_detail = described_class.new(organisation_more_than_one_site: false)

      expect(respondent_detail.organisation_more_than_one_site).to be false
    end

    it 'with employment at site number only' do
      respondent_detail = described_class.new(employment_at_site_number: 20)

      expect(respondent_detail.employment_at_site_number). to be 20
    end
  end

  describe ".to_h " do
    it "will take two strings and convert them into a hash" do
      respondent_detail = described_class.new(case_number: '7654321/2017')

      expect(respondent_detail.to_h).to be_a(Hash)
    end

    it 'will return the value for a key' do
      respondent_detail = described_class.new(case_number: '7654321/2017')

      expect(respondent_detail.to_h).to include(case_number: '7654321/2017')
    end
  end

  # context "when not populated" do
  #   it "will not validate case_number" do
  #     respondent_detail = described_class.new(case_number: '')

  #     expect(respondent_detail.case_number).to raise_error
  #   end

  #   it "will not validate name" do
  #     respondent_detail = described_class.new(name: '')

  #     expect { respondent_detail.name }.to raise_error
  #   end

  #   it "will not validate building_name" do
  #     respondent_detail = described_class.new(building_name: '')

  #     expect(respondent_detail.building_name).to raise_error
  #   end

  #   it "will not validate street_name" do
  #     respondent_detail = described_class.new(street_name: '')

  #     expect(respondent_detail.street_name).to raise_error
  #   end

  #   it "will not validate town" do
  #     respondent_detail = described_class.new(town: '')

  #     expect(respondent_detail.town).to raise_error
  #   end
  # end
end
