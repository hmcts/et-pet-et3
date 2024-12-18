require 'rails_helper'
require 'faker'

RSpec.describe EmployersContractClaim, type: :model do

  let(:four_thousand_five_hundred_and_one_characters) { Faker::Lorem.characters(number: 4501) }

  let(:populated_employers_contract_claim) {
    described_class.new(
      make_employer_contract_claim: true, claim_information: 'lorem ipsum claim'
    )
  }

  context 'with validators' do
    it 'does not validate claim_information over 4,500 characters' do
      populated_employers_contract_claim.claim_information = four_thousand_five_hundred_and_one_characters

      populated_employers_contract_claim.valid?

      expect(populated_employers_contract_claim.errors.details[:claim_information]).to include a_hash_including(error: :too_long)
    end
  end

  context 'when correctly populated' do

    it 'returns the correct make_employer_contract_claim' do
      expect(populated_employers_contract_claim.make_employer_contract_claim).to be true
    end

    it 'returns the correct claim_information' do
      expect(populated_employers_contract_claim.claim_information).to eql 'lorem ipsum claim'
    end

  end

  describe ".to_h" do
    it "returns a hash" do
      expect(populated_employers_contract_claim.to_h).to be_a(Hash)
    end

    it 'returns the make_employer_contract_claim key and value pair' do
      expect(populated_employers_contract_claim.to_h).to include(make_employer_contract_claim: true)
    end

    it 'returns the claim_information key and value pair' do
      expect(populated_employers_contract_claim.to_h).to include(claim_information: 'lorem ipsum claim')
    end

  end

  context 'when left blank' do
    it 'does not raise a validation error on make_employer_contract_claim' do
      populated_employers_contract_claim.make_employer_contract_claim = nil

      populated_employers_contract_claim.valid?

      expect(populated_employers_contract_claim).to be_valid
    end

    it 'does not raise a validation error on claim_information' do
      populated_employers_contract_claim.claim_information = nil

      populated_employers_contract_claim.valid?

      expect(populated_employers_contract_claim).to be_valid
    end
  end

  context "when making an employer contract claim" do
    it 'raises a validation error on claim information' do
      populated_employers_contract_claim.make_employer_contract_claim = true
      populated_employers_contract_claim.claim_information = four_thousand_five_hundred_and_one_characters

      populated_employers_contract_claim.valid?

      expect(populated_employers_contract_claim.errors.details[:claim_information]).to include a_hash_including(error: :too_long)
    end
  end

  context "when not making an employer contract claim" do
    it 'does not validate claim information' do
      populated_employers_contract_claim.make_employer_contract_claim = false
      populated_employers_contract_claim.claim_information = four_thousand_five_hundred_and_one_characters

      expect(populated_employers_contract_claim).to be_valid
    end

    it 'does not hash claim information' do
      populated_employers_contract_claim.make_employer_contract_claim = false

      expect(populated_employers_contract_claim.to_h).not_to include(:claim_information)
    end
  end
end
