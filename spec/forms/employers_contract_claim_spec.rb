require 'rails_helper'

RSpec.describe EmployersContractClaim, type: :model do

  context 'when correctly populated' do

    it 'with make_employer_contract_claim only' do
      employers_contract_claim = described_class.new(make_employer_contract_claim: true)

      expect(employers_contract_claim.make_employer_contract_claim).to be true
    end

    # Unit tests for upload functionality
    it 'with defend_claim_facts only' do
      # employers_contract_claim = described_class.new(uploaded_content: 'some sort of content test')

      # expect(employers_contract_claim.uploaded_content).to eql 'some sort of content test'
    end
  end
end
