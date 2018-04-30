class EmployersContractClaim < BaseForm
  attribute :make_employer_contract_claim, :boolean
  attribute :claim_information, :text

  def to_h
    {
      make_employer_contract_claim: make_employer_contract_claim,
      claim_information: claim_information
    }
  end

  validates :claim_information,
    length: {
      maximum: 4500,
      too_long: "%{count} characters is the maximum allowed" # rubocop:disable Style/FormatStringToken
    }
end
