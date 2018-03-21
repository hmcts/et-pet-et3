require 'rails_helper'

RSpec.describe Response, type: :model do

  context 'when correctly populated' do

    it 'with defend_claim only' do
      response = described_class.new(defend_claim: true)

      expect(response.defend_claim).to be true
    end

    it 'with defend_claim_facts only' do
      response = described_class.new(defend_claim_facts: 'lorem ipsum defend claim facts')

      expect(response.defend_claim_facts).to eql 'lorem ipsum defend claim facts'
    end
  end

  describe ".to_h " do
    it "will take two strings and convert them into a hash" do
      response = described_class.new(defend_claim: true)

      expect(response.to_h).to be_a(Hash)
    end

    it 'will return the defend_claim key and value pair' do
      response = described_class.new(defend_claim: true)

      expect(response.to_h).to include(defend_claim: true)
    end

    it 'will return the defend_claim_facts key and value pair' do
      response = described_class.new(defend_claim_facts: 'lorem ipsum defence')

      expect(response.to_h).to include(defend_claim_facts: 'lorem ipsum defence')
    end
  end
end
