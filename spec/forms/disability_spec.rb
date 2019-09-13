require 'rails_helper'

RSpec.describe Disability, type: :model do

  let(:populated_disability) {
    described_class.new(
      disability: true, disability_information: 'Lorem ipsum disability'
    )
  }

  let(:three_hundred_fifty_one_chars) { Faker::Lorem.characters(number: 351) }

  context 'with validators' do

    it 'will not validate disability information over 350 characters' do
      populated_disability.disability_information = three_hundred_fifty_one_chars

      populated_disability.valid?

      expect(populated_disability.errors.details[:disability_information]).to include a_hash_including(error: :too_long)
    end
  end

  context 'when correctly populated' do

    it 'returns the disability' do
      expect(populated_disability.disability).to be true
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_disability.to_h).to be_a(Hash)
    end

    it 'will return the disability key and value pair' do
      expect(populated_disability.to_h).to include(disability: true)
    end

    it 'will return the disability_information key and value pair' do
      expect(populated_disability.to_h).to include(disability_information: 'Lorem ipsum disability')
    end
  end

  context "when left blank" do
    it 'will not raise a validation error on disability' do
      populated_disability.disability = nil

      populated_disability.valid?

      expect(populated_disability).to be_valid
    end
  end

  context 'when respondent has disability' do
    it 'will raise a validation if disability information is not entered' do
      populated_disability.disability = true
      populated_disability.disability_information = nil

      populated_disability.valid?

      expect(populated_disability.errors.details[:disability_information]).to include a_hash_including(error: :blank)
    end

    it 'will not raise a validation if disability information is provided' do
      populated_disability.disability = true
      populated_disability.disability_information = 'Lorem ipsum disability'

      populated_disability.valid?

      expect(populated_disability).to be_valid
    end
  end

  context "when respondent does not have a disability" do
    it 'will not validate disability information' do
      populated_disability.disability = false
      populated_disability.disability_information = three_hundred_fifty_one_chars

      expect(populated_disability).to be_valid
    end

    it 'will not hash respondent disability information' do
      populated_disability.disability = false
      populated_disability.disability_information = 'Lorem ipsum disability'

      expect(populated_disability.to_h).not_to include(:disability_information)
    end
  end
end
