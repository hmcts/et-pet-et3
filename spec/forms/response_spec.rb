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
end
