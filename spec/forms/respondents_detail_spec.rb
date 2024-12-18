require 'rails_helper'

RSpec.describe RespondentsDetail, type: :model do

  let(:populated_respondent_detail) {
    described_class.new(
      case_number: '2454321/2017', name: 'dodgy_co', contact: 'John Smith', building_name: 'the_shard', street_name: 'downing_street',
      town: 'westminster', county: 'greater london', postcode: 'wc1 1aa', dx_number: '724060 Derby 21', contact_number: '0207 123 4567',
      mobile_number: '07123456789', contact_preference: 'email', email_address: 'john@dodgyco.com',
      organisation_employ_gb: 100, organisation_more_than_one_site: true, employment_at_site_number: 20, allow_phone_or_video_attendance: ['video']
    )
  }

  context 'with validators' do

    it 'does not validate a case number with letters' do
      populated_respondent_detail.case_number = "a654321/2017"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:case_number]).to include a_hash_including(error: :invalid)
    end

    it 'does not validate an incorrect email address' do
      populated_respondent_detail.contact_preference = "email"
      populated_respondent_detail.email_address = "fakeemail.com"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:email_address]).to include a_hash_including(error: :invalid_email)
    end

    it 'does not validate a name with numbers in' do
      populated_respondent_detail.contact = "J0hn Sm1th"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:contact]).to include a_hash_including(error: :contains_numbers)
    end

    it 'does not validate a contact_number with letters' do
      populated_respondent_detail.contact_number = "O203 I23 A56T"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:contact_number]).to include a_hash_including(error: :invalid_phone_number)
    end

    it 'does not validate a mobile_number with more than one "+"' do
      populated_respondent_detail.mobile_number = "+44+7123456789"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:mobile_number]).to include a_hash_including(error: :invalid_phone_number)
    end

    it 'uses uk_postcode gem to prevent invalid postcodes being saved' do
      populated_respondent_detail.postcode = "not a postcode"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:postcode]).to include a_hash_including(error: :invalid_postcode)
    end

    it 'uses numericality to invalidate employment at site not being a number' do
      populated_respondent_detail.organisation_more_than_one_site = true
      populated_respondent_detail.employment_at_site_number = "string instead of number"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:employment_at_site_number]).to include a_hash_including(error: :not_a_number)
    end

    it 'uses numericality to invalidate organisation employ gb not being a number' do
      populated_respondent_detail.organisation_employ_gb = "string instead of number"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:organisation_employ_gb]).to include a_hash_including(error: :not_a_number)
    end

  end

  context 'when correctly populated' do

    it 'returns the correct case number' do
      expect(populated_respondent_detail.case_number).to eql '2454321/2017'
    end

    it 'returns the correct name' do
      expect(populated_respondent_detail.name).to eql 'dodgy_co'
    end

    it 'returns the correct contact' do
      expect(populated_respondent_detail.contact).to eql 'John Smith'
    end

    it 'returns the correct building_name' do
      expect(populated_respondent_detail.building_name).to eql 'the_shard'
    end

    it 'returns the correct street_name' do
      expect(populated_respondent_detail.street_name).to eql 'downing_street'
    end

    it 'returns the correct town' do
      expect(populated_respondent_detail.town).to eql 'westminster'
    end

    it 'returns the correct county' do
      expect(populated_respondent_detail.county).to eql 'greater london'
    end

    it 'returns the correct postcode' do
      expect(populated_respondent_detail.postcode).to eql 'wc1 1aa'
    end

    it 'returns the correct DX number' do
      expect(populated_respondent_detail.dx_number).to eql '724060 Derby 21'
    end

    it 'returns the correct contact number' do
      expect(populated_respondent_detail.contact_number).to eql '0207 123 4567'
    end

    it 'returns the correct mobile number' do
      expect(populated_respondent_detail.mobile_number).to eql '07123456789'
    end

    it 'returns the correct contact_preference' do
      expect(populated_respondent_detail.contact_preference).to eql 'email'
    end

    it 'returns the correct email_address' do
      expect(populated_respondent_detail.email_address).to eql 'john@dodgyco.com'
    end

    it 'returns the correct organisation_employ_gb' do
      expect(populated_respondent_detail.organisation_employ_gb).to be 100
    end

    it 'returns the correct organisation_more_than_one_site' do
      expect(populated_respondent_detail.organisation_more_than_one_site).to be true
    end

    it 'returns the correct employment at site number' do
      expect(populated_respondent_detail.employment_at_site_number).to be 20
    end
  end

  describe ".to_h" do
    it "takes two strings and convert them into a hash" do
      expect(populated_respondent_detail.to_h).to be_a(Hash)
    end

    it 'returns the case_number key and value pair' do
      expect(populated_respondent_detail.to_h).to include(case_number: '2454321/2017')
    end

    it 'returns the name key and value pair' do
      expect(populated_respondent_detail.to_h).to include(name: 'dodgy_co')
    end

    it 'returns the contact key and value pair' do
      expect(populated_respondent_detail.to_h).to include(contact: 'John Smith')
    end

    it 'returns the building_name key and value pair' do
      expect(populated_respondent_detail.to_h).to include(building_name: 'the_shard')
    end

    it 'returns the street_name key and value pair' do
      expect(populated_respondent_detail.to_h).to include(street_name: 'downing_street')
    end

    it 'returns the town key and value pair' do
      expect(populated_respondent_detail.to_h).to include(town: 'westminster')
    end

    it 'returns the county key and value pair' do
      expect(populated_respondent_detail.to_h).to include(county: 'greater london')
    end

    it 'returns the postcode key and value pair' do
      expect(populated_respondent_detail.to_h).to include(postcode: 'wc1 1aa')
    end

    it 'returns the dx_number key and value pair' do
      expect(populated_respondent_detail.to_h).to include(dx_number: '724060 Derby 21')
    end

    it 'returns the contact_number key and value pair' do
      expect(populated_respondent_detail.to_h).to include(contact_number: '0207 123 4567')
    end

    it 'returns the mobile_number key and value pair' do
      expect(populated_respondent_detail.to_h).to include(mobile_number: '07123456789')
    end

    it 'returns the contact_preference key and value pair' do
      expect(populated_respondent_detail.to_h).to include(contact_preference: 'email')
    end

    it 'returns the email_address key and value pair' do
      expect(populated_respondent_detail.to_h).to include(email_address: 'john@dodgyco.com')
    end

    it 'returns the organisation_employ_gb key and value pair' do
      expect(populated_respondent_detail.to_h).to include(organisation_employ_gb: 100)
    end

    it 'returns the organisation_more_than_one_site key and value pair' do
      expect(populated_respondent_detail.to_h).to include(organisation_more_than_one_site: true)
    end

    it 'returns the employment_at_site_number key and value pair' do
      expect(populated_respondent_detail.to_h).to include(employment_at_site_number: 20)
    end
  end

  context "when left blank" do
    it 'raises a validation error on case_number' do
      populated_respondent_detail.case_number = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:case_number]).to include a_hash_including(error: :invalid)
    end

    it 'raises a validation error on name' do
      populated_respondent_detail.name = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:name]).to include a_hash_including(error: :blank)
    end

    it 'does not raise a validation error on contact' do
      populated_respondent_detail.contact = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'raises a validation error on building_name' do
      populated_respondent_detail.building_name = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:building_name]).to include a_hash_including(error: :blank)
    end

    it 'raises a validation error on street_name' do
      populated_respondent_detail.street_name = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:street_name]).to include a_hash_including(error: :blank)
    end

    it 'raises a validation error on town' do
      populated_respondent_detail.town = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:town]).to include a_hash_including(error: :blank)
    end

    it 'does not raise a validation error on county' do
      populated_respondent_detail.county = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'raises a validation error on postcode' do
      populated_respondent_detail.postcode = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:postcode]).to include a_hash_including(error: :blank)
    end

    it 'does not raise a validation error on dx_number' do
      populated_respondent_detail.dx_number = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on contact_number' do
      populated_respondent_detail.contact_number = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on mobile_number' do
      populated_respondent_detail.mobile_number = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on contact_preference' do
      populated_respondent_detail.contact_preference = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on email_address' do
      populated_respondent_detail.contact_preference = nil
      populated_respondent_detail.email_address = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on organisation_employ_gb' do
      populated_respondent_detail.organisation_employ_gb = nil

      expect(populated_respondent_detail).to be_valid
    end

    it 'does not raise a validation error on employment_at_site_number' do
      populated_respondent_detail.organisation_more_than_one_site = false
      populated_respondent_detail.employment_at_site_number = nil

      expect(populated_respondent_detail).to be_valid
    end
  end

  context "when email is the preferred contact method" do

    it "raises a validation error if an email address is not entered" do
      populated_respondent_detail.contact_preference = "email"
      populated_respondent_detail.email_address = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:email_address]).to include a_hash_including(error: :invalid_email)
    end

    it "does not raise a validation error if an email address is provided" do
      populated_respondent_detail.contact_preference = "email"
      populated_respondent_detail.email_address = "john@dodgyco.com"

      expect(populated_respondent_detail).to be_valid
    end
  end

  context "when post is the preferred contact method" do

    it "does not validate an email address" do
      populated_respondent_detail.contact_preference = "post"
      populated_respondent_detail.email_address = "invalid email"

      expect(populated_respondent_detail).to be_valid
    end

    it "does not hash an email address" do
      populated_respondent_detail.contact_preference = "post"
      populated_respondent_detail.email_address = "john@dodgyco.com"

      expect(populated_respondent_detail.to_h).not_to include(:email_address)
    end
  end

  context "when the organisation has more than one site" do

    it "raises a validation error if the number of employees at the claimant's site is not entered" do
      populated_respondent_detail.organisation_more_than_one_site = true
      populated_respondent_detail.employment_at_site_number = nil

      populated_respondent_detail.valid?

      expect(populated_respondent_detail.errors.details[:employment_at_site_number]).to include a_hash_including(error: :not_a_number)
    end

    it "does not raise a validation error if the number of employees at the claimant's site is provided" do
      populated_respondent_detail.organisation_more_than_one_site = true
      populated_respondent_detail.employment_at_site_number = 20

      expect(populated_respondent_detail).to be_valid
    end

  end

  context "when the organisation does not have more than one site" do
    it "does not validate an employment at site number" do
      populated_respondent_detail.organisation_more_than_one_site = false
      populated_respondent_detail.employment_at_site_number = "fsdf"

      populated_respondent_detail.valid?

      expect(populated_respondent_detail).to be_valid
    end

    it "does not hash an employment at site number" do
      populated_respondent_detail.organisation_more_than_one_site = false
      populated_respondent_detail.employment_at_site_number = 20

      expect(populated_respondent_detail.to_h).not_to include(:employment_at_site_number)
    end
  end

end
