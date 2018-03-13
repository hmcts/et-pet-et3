require 'rails_helper'

RSpec.describe EmployersContractClaim, type: :model do

  context 'when correctly populated' do

    it 'with make_employer_contract_claim only' do
      employers_contract_claim = described_class.new(make_employer_contract_claim: true)

      expect(employers_contract_claim.make_employer_contract_claim).to be true
    end

    it 'with claim_information only' do
      employers_contract_claim = described_class.new(claim_information: 'lorem ipsum claim')

      expect(employers_contract_claim.claim_information).to eql 'lorem ipsum claim'
    end

    # TODO: Unit tests for upload functionality

  end

  describe ".to_h " do
    it "will take two strings and convert them into a hash" do
      employers_contract_claim = described_class.new(make_employer_contract_claim: true, claim_information: 'lorem ipsum claim', uploaded_content: 'path/to/file.rtf')

      expect(employers_contract_claim.to_h).to be_a(Hash)
    end

    it 'will return the value for a key' do
      employers_contract_claim = described_class.new(make_employer_contract_claim: true)

      expect(employers_contract_claim.to_h).to include(make_employer_contract_claim: true)
    end
  end
end
