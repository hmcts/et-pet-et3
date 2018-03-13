class Response < BaseForm
  attribute :defend_claim, :boolean
  attribute :defend_claim_facts, :text

  def to_h
    {
      defend_claim: defend_claim,
      defend_claim_facts: defend_claim_facts
    }
  end
end
