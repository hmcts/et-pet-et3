class Response < BaseForm
  attribute :defend_claim, :boolean
  attribute :defend_claim_facts, :text

  def to_h
    {
      defend_claim: defend_claim,
      defend_claim_facts: defend_claim_facts
    }
  end

  validates :defend_claim,
    inclusion: { in: [true, false] }
  validates :defend_claim_facts,
    length: {
      maximum: 2500,
      too_long: "%{count} characters is the maximum allowed" # rubocop:disable Style/FormatStringToken
    }
end
