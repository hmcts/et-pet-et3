class EmployersContractClaim < BaseForm
  attribute :make_employer_contract_claim, :boolean
  attribute :claim_information, :text

  def to_h
    employer_contract_claim_hash = {
      make_employer_contract_claim: make_employer_contract_claim
    }

    employer_contract_claim_hash.merge!(claim_information: claim_information) if employer_contract_claim_hash[:make_employer_contract_claim]

    employer_contract_claim_hash
  end

  validates :claim_information,
    length: {
      maximum: 4500,
      too_long: "%{count} characters is the maximum allowed" # rubocop:disable Style/FormatStringToken
    },
    if: :make_claim?

  private

  def make_claim?
    make_employer_contract_claim
  end
end
