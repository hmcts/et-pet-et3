class EmployersContractClaim < BaseForm
  attribute :make_employer_contract_claim, :boolean
  attribute :claim_information, :text
  attribute :uploaded_content, :string

  def to_h
    {
      make_employer_contract_claim: make_employer_contract_claim,
      claim_information: claim_information,
      uploaded_content: uploaded_content
    }
  end
end
