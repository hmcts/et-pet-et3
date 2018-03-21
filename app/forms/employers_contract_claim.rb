class EmployersContractClaim < BaseForm
  attribute :make_employer_contract_claim, :boolean
  attribute :claim_information, :text
  attribute :upload_additional_information, :string

  def to_h
    {
      make_employer_contract_claim: make_employer_contract_claim,
      claim_information: claim_information,
      upload_additional_information: upload_additional_information
    }
  end
end
