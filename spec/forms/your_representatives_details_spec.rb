require 'rails_helper'

RSpec.describe YourRepresentativesDetails, type: :model do

  let(:populated_your_representatives_details) {
    described_class.new(
      type_of_representative: 'Law Centre', representative_org_name: 'repco ltd', representative_name: 'Jane Doe',
      representative_building: 'Rep Building', representative_street: 'Rep Street', representative_town: 'Rep Town',
      representative_county: 'Rep County', representative_postcode: 'WC2 2BB', representative_phone: '0207 987 6543',
      representative_mobile: '07987654321', representative_dx_number: 'DX 123 London 456', representative_reference: 'Rep Ref',
      representative_contact_preference: 'email', representative_email: 'your@representative.email',
      representative_fax: '0207 345 6789'
    )
  }

  let(:three_hundred_fifty_one_chars) { Faker::Lorem.characters(351) }

  context 'with validators' do
    it 'will not validate a name with numbers in' do
      populated_your_representatives_details.representative_name = 'J4ne D0e'

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_name]).to include a_hash_including(error: :contains_numbers)
    end

    it 'uses uk_postcode gem to prevent invalid postcodes being saved' do
      populated_your_representatives_details.representative_postcode = "not a postcode"

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_postcode]).to include a_hash_including(error: :invalid_postcode)
    end

    it 'will not validate a contact_number with less than 7 integers' do
      populated_your_representatives_details.representative_phone = "+0044---------9"

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_phone]).to include a_hash_including(error: :invalid_phone_number)
    end

    it 'will not validate a mobile_number with letter characters' do
      populated_your_representatives_details.representative_mobile = "+44 71234567B9"

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_mobile]).to include a_hash_including(error: :invalid_phone_number)
    end

    it 'will not validate an email address without a domain' do
      populated_your_representatives_details.representative_contact_preference = "email"
      populated_your_representatives_details.representative_email = "nodomain@.com"

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_email]).to include a_hash_including(error: :invalid_email)
    end

    it 'will not validate a fax number with a "+" outside the first character' do
      populated_your_representatives_details.representative_contact_preference = "fax"
      populated_your_representatives_details.representative_fax = "0207+123+4567"

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_fax]).to include a_hash_including(error: :invalid_phone_number)
    end

  end

  context 'when correctly populated' do

    it 'returns the type_of_representative' do
      expect(populated_your_representatives_details.type_of_representative).to eql 'Law Centre'
    end

    it 'returns the representative_org_name' do
      expect(populated_your_representatives_details.representative_org_name).to eql 'repco ltd'
    end

    it 'returns the representative_name' do
      expect(populated_your_representatives_details.representative_name).to eql 'Jane Doe'
    end

    it 'returns the representative_building' do
      expect(populated_your_representatives_details.representative_building).to eql 'Rep Building'
    end

    it 'returns the representative_street' do
      expect(populated_your_representatives_details.representative_street).to eql 'Rep Street'
    end

    it 'returns the representative_town' do
      expect(populated_your_representatives_details.representative_town).to eql 'Rep Town'
    end

    it 'returns the representative_county' do
      expect(populated_your_representatives_details.representative_county).to eql 'Rep County'
    end

    it 'returns the representative_postcode' do
      expect(populated_your_representatives_details.representative_postcode).to eql 'WC2 2BB'
    end

    it 'returns the representative_phone' do
      expect(populated_your_representatives_details.representative_phone).to eql '0207 987 6543'
    end

    it 'returns the representative_mobile' do
      expect(populated_your_representatives_details.representative_mobile).to eql '07987654321'
    end

    it 'returns the representative_dx_number' do
      expect(populated_your_representatives_details.representative_dx_number).to eql 'DX 123 London 456'
    end

    it 'returns the representative_reference' do
      expect(populated_your_representatives_details.representative_reference).to eql 'Rep Ref'
    end

    it 'with representative_contact_preference only' do
      expect(populated_your_representatives_details.representative_contact_preference).to eql 'email'
    end

    it 'returns the representative_email' do
      expect(populated_your_representatives_details.representative_email).to eql 'your@representative.email'
    end

    it 'returns the representative_fax' do
      expect(populated_your_representatives_details.representative_fax).to eql '0207 345 6789'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_your_representatives_details.to_h).to be_a(Hash)
    end

    it 'will return the type_of_representative key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(type_of_representative: 'Law Centre')
    end

    it 'will return the representative_org_name key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_org_name: 'repco ltd')
    end

    it 'will return the representative_name key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_name: 'Jane Doe')
    end

    it 'will return the representative_building key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_building: 'Rep Building')
    end

    it 'will return the representative_street key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_street: 'Rep Street')
    end

    it 'will return the representative_town key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_town: 'Rep Town')
    end

    it 'will return the representative_county key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_county: 'Rep County')
    end

    it 'will return the representative_postcode key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_postcode: 'WC2 2BB')
    end

    it 'will return the representative_phone key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_phone: '0207 987 6543')
    end

    it 'will return the representative_mobile key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_mobile: '07987654321')
    end

    it 'will return the representative_dx_number key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_dx_number: 'DX 123 London 456')
    end

    it 'will return the representative_reference key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_reference: 'Rep Ref')
    end

    it 'will return the representative_contact_preference key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_contact_preference: 'email')
    end

    it 'will return the representative_email key and value pair' do
      expect(populated_your_representatives_details.to_h).to include(representative_email: 'your@representative.email')
    end

    it 'will return the representative_fax key and value pair' do
      populated_your_representatives_details.representative_contact_preference = "fax"
      expect(populated_your_representatives_details.to_h).to include(representative_fax: '0207 345 6789')
    end
  end

  context "when left blank" do
    it 'will raise a validation error on type_of_representative' do
      populated_your_representatives_details.type_of_representative = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:type_of_representative]).to include a_hash_including(error: :inclusion)
    end

    it 'will not raise a validation error on representative_org_name' do
      populated_your_representatives_details.representative_org_name = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_name' do
      populated_your_representatives_details.representative_name = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_name]).to include a_hash_including(error: :blank)
    end

    it 'will raise a validation error on representative_building' do
      populated_your_representatives_details.representative_building = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_building]).to include a_hash_including(error: :blank)
    end

    it 'will raise a validation error on representative_street' do
      populated_your_representatives_details.representative_street = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_street]).to include a_hash_including(error: :blank)
    end

    it 'will raise a validation error on representative_town' do
      populated_your_representatives_details.representative_town = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_town]).to include a_hash_including(error: :blank)
    end

    it 'will not raise a validation error on representative_county' do
      populated_your_representatives_details.representative_county = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_postcode' do
      populated_your_representatives_details.representative_postcode = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_postcode]).to include a_hash_including(error: :blank)
    end

    it 'will not raise a validation error on representative_phone' do
      populated_your_representatives_details.representative_phone = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_mobile' do
      populated_your_representatives_details.representative_mobile = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_dx_number' do
      populated_your_representatives_details.representative_dx_number = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_reference' do
      populated_your_representatives_details.representative_reference = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will raise a validation error on representative_contact_preference' do
      populated_your_representatives_details.representative_contact_preference = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details).to be_valid
    end

  end

  context "when email is the preferred contact method" do
    it "will raise a validation error if an email address is not entered" do
      populated_your_representatives_details.representative_contact_preference = "email"
      populated_your_representatives_details.representative_email = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_email]).to include a_hash_including(error: :invalid_email)
    end

    it "will not raise a validation error if an email address is provided" do
      populated_your_representatives_details.representative_contact_preference = "email"
      populated_your_representatives_details.representative_email = "john@dodgyco.com"

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will not validate a fax number' do
      populated_your_representatives_details.representative_contact_preference = "email"
      populated_your_representatives_details.representative_fax = "invalid fax"

      expect(populated_your_representatives_details).to be_valid
    end

    it 'will not hash a fax number' do
      populated_your_representatives_details.representative_contact_preference = "email"
      populated_your_representatives_details.representative_fax = "0203 123 4567"

      expect(populated_your_representatives_details.to_h).not_to include(:representative_fax)
    end
  end

  context "when post is the preferred contact method" do

    it "will not validate an email address or fax number" do
      populated_your_representatives_details.representative_contact_preference = "post"
      populated_your_representatives_details.representative_email = "invalid email"
      populated_your_representatives_details.representative_fax = "invalid fax"

      expect(populated_your_representatives_details).to be_valid
    end

    it "will not hash an email address" do
      populated_your_representatives_details.representative_contact_preference = "post"
      populated_your_representatives_details.representative_email = "john@dodgyco.com"

      expect(populated_your_representatives_details.to_h).not_to include(:representative_email)
    end

    it "will not hash a fax number" do
      populated_your_representatives_details.representative_contact_preference = "post"
      populated_your_representatives_details.representative_fax = "0203 123 4567"

      expect(populated_your_representatives_details.to_h).not_to include(:representative_fax)
    end
  end

  context "when fax is the preferred contact method" do
    it "will raise a validation error if a fax number is not entered" do
      populated_your_representatives_details.representative_contact_preference = "fax"
      populated_your_representatives_details.representative_fax = nil

      populated_your_representatives_details.valid?

      expect(populated_your_representatives_details.errors.details[:representative_fax]).to include a_hash_including(error: :invalid_phone_number)
    end

    it "will not raise a validation error if a fax number is provided" do
      populated_your_representatives_details.representative_contact_preference = "fax"
      populated_your_representatives_details.representative_fax = "0203 123 4567"

      expect(populated_your_representatives_details).to be_valid
    end

    it "will not validate an email address" do
      populated_your_representatives_details.representative_contact_preference = "fax"
      populated_your_representatives_details.representative_email = "invalid email"

      expect(populated_your_representatives_details).to be_valid
    end

    it "will not hash an email address" do
      populated_your_representatives_details.representative_contact_preference = "fax"
      populated_your_representatives_details.representative_email = "john@dodgyco.com"

      expect(populated_your_representatives_details.to_h).not_to include(:representative_email)
    end
  end

end
