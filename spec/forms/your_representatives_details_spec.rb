require 'rails_helper'

RSpec.describe YourRepresentativesDetails, type: :model do

  context 'when correctly populated' do

    it 'with type_of_representative only' do
      your_representatives_details = described_class.new(type_of_representative: 'Law Centre')

      expect(your_representatives_details.type_of_representative).to eql 'Law Centre'
    end

    it 'with representative_org_name only' do
      your_representatives_details = described_class.new(representative_org_name: 'repco ltd')

      expect(your_representatives_details.representative_org_name).to eql 'repco ltd'
    end

    it 'with representative_name only' do
      your_representatives_details = described_class.new(representative_name: 'jane doe')

      expect(your_representatives_details.representative_name).to eql 'jane doe'
    end

    it 'with representative_building only' do
      your_representatives_details = described_class.new(representative_building: 'rep building')

      expect(your_representatives_details.representative_building).to eql 'rep building'
    end

    it 'with representative_street only' do
      your_representatives_details = described_class.new(representative_street: 'rep street')

      expect(your_representatives_details.representative_street).to eql 'rep street'
    end

    it 'with representative_town only' do
      your_representatives_details = described_class.new(representative_town: 'rep town')

      expect(your_representatives_details.representative_town).to eql 'rep town'
    end

    it 'with representative_county only' do
      your_representatives_details = described_class.new(representative_county: 'rep county')

      expect(your_representatives_details.representative_county).to eql 'rep county'
    end

    it 'with representative_postcode only' do
      your_representatives_details = described_class.new(representative_postcode: 'wc2 2bb')

      expect(your_representatives_details.representative_postcode).to eql 'wc2 2bb'
    end

    it 'with representative_phone only' do
      your_representatives_details = described_class.new(representative_phone: '0207 987 6543')

      expect(your_representatives_details.representative_phone).to eql '0207 987 6543'
    end

    it 'with representative_mobile only' do
      your_representatives_details = described_class.new(representative_mobile: '07987654321')

      expect(your_representatives_details.representative_mobile).to eql '07987654321'
    end

    it 'with representative_dx_number only' do
      your_representatives_details = described_class.new(representative_dx_number: 'dx address')

      expect(your_representatives_details.representative_dx_number).to eql 'dx address'
    end

    it 'with representative_reference only' do
      your_representatives_details = described_class.new(representative_reference: 'rep ref')

      expect(your_representatives_details.representative_reference).to eql 'rep ref'
    end

    it 'with representative_contact_preference only' do
      your_representatives_details = described_class.new(representative_contact_preference: 'email')

      expect(your_representatives_details.representative_contact_preference).to eql 'email'
    end

    it 'with representative_email only' do
      your_representatives_details = described_class.new(representative_email: 'your@representative.email')

      expect(your_representatives_details.representative_email).to eql 'your@representative.email'
    end

    it 'with representative_fax only' do
      your_representatives_details = described_class.new(representative_fax: '0207 345 6789')

      expect(your_representatives_details.representative_fax).to eql '0207 345 6789'
    end

    it 'with representative_disability only' do
      your_representatives_details = described_class.new(representative_disability: true)

      expect(your_representatives_details.representative_disability).to be true
    end
  end
end
