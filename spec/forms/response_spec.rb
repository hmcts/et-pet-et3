require 'rails_helper'

RSpec.describe Response, type: :model do

  let(:populated_response) {
    described_class.new(
      defend_claim: true, defend_claim_facts: 'lorem ipsum defend claim facts'
    )
  }

  let(:two_thousand_five_hundred_and_one_characters) { Faker::Lorem.characters(number: 2501) }

  context 'with validators' do

    it 'will not validate defend claim facts over 2,500 characters' do
      populated_response.defend_claim_facts = two_thousand_five_hundred_and_one_characters

      populated_response.valid?

      expect(populated_response.errors.details[:defend_claim_facts]).to include a_hash_including(error: :too_long)
    end

  end

  context 'when correctly populated' do

    it 'returns the correct defend_claim' do
      expect(populated_response.defend_claim).to be true
    end

    it 'returns the correct defend_claim_facts' do
      expect(populated_response.defend_claim_facts).to eql 'lorem ipsum defend claim facts'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_response.to_h).to be_a(Hash)
    end

    it 'will return the defend_claim key and value pair' do
      expect(populated_response.to_h).to include(defend_claim: true)
    end

    it 'will return the defend_claim_facts key and value pair' do
      expect(populated_response.to_h).to include(defend_claim_facts: 'lorem ipsum defend claim facts')
    end
  end

  context 'when left blank' do
    it 'will raise a validation error on defend claim' do
      populated_response.defend_claim = nil

      populated_response.valid?

      expect(populated_response.errors.details[:defend_claim]).to include a_hash_including(error: :inclusion)
    end

    it 'will not raise a validation error on defend claim facts' do
      populated_response.defend_claim_facts = nil

      populated_response.valid?

      expect(populated_response).to be_valid
    end
  end

  context "when defending the claim" do
    it 'will raise a validation error on defend_claim_facts' do
      populated_response.defend_claim = true
      populated_response.defend_claim_facts = two_thousand_five_hundred_and_one_characters

      populated_response.valid?

      expect(populated_response.errors.details[:defend_claim_facts]).to include a_hash_including(error: :too_long)
    end
  end

  context "when not defending the claim" do
    it 'will not validate defend claim facts' do
      populated_response.defend_claim = false
      populated_response.defend_claim_facts = two_thousand_five_hundred_and_one_characters

      expect(populated_response).to be_valid
    end

    it 'will not hash defend claim facts' do
      populated_response.defend_claim = false
      populated_response.defend_claim_facts = two_thousand_five_hundred_and_one_characters

      expect(populated_response.to_h).not_to include(:defend_claim_facts)
    end
  end
end
