class Response < BaseForm
  attribute :defend_claim, :boolean
  attribute :defend_claim_facts, :text

  def to_h
    response_hash = {
      defend_claim: defend_claim,
    }

    response_hash[:defend_claim_facts] = defend_claim_facts if response_hash[:defend_claim]

    response_hash
  end

  validates :defend_claim,
    inclusion: { in: [true, false] }
  validates :defend_claim_facts,
    length: {
      maximum: 2500
    },
    if: :defend_claim?

  private

  def defend_claim?
    defend_claim
  end
end
