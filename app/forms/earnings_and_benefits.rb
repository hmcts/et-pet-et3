class EarningsAndBenefits < BaseForm
  attribute :agree_with_claimants_hours, :boolean
  attribute :queried_hours, :float
  attribute :agree_with_earnings_details, :boolean
  attribute :queried_pay_before_tax, :currency_float
  attribute :queried_pay_before_tax_period, :string
  attribute :queried_take_home_pay, :currency_float
  attribute :queried_take_home_pay_period, :string
  attribute :agree_with_claimant_notice, :boolean
  attribute :disagree_claimant_notice_reason, :text
  attribute :agree_with_claimant_pension_benefits, :boolean
  attribute :disagree_claimant_pension_benefits_reason, :text

  def to_h
    earnings_and_benefits_hash = {
      agree_with_claimants_hours: agree_with_claimants_hours,
      agree_with_earnings_details: agree_with_earnings_details,
      agree_with_claimant_notice: agree_with_claimant_notice,
      agree_with_claimant_pension_benefits: agree_with_claimant_pension_benefits
    }

    earnings_and_benefits_hash[:queried_hours] = queried_hours if earnings_and_benefits_hash[:agree_with_claimants_hours] == false
    if earnings_and_benefits_hash[:agree_with_earnings_details] == false
      earnings_and_benefits_hash.merge!(queried_pay_before_tax: queried_pay_before_tax,
                                        queried_pay_before_tax_period: queried_pay_before_tax_period,
                                        queried_take_home_pay: queried_take_home_pay,
                                        queried_take_home_pay_period: queried_take_home_pay_period)
    end
    earnings_and_benefits_hash[:disagree_claimant_notice_reason] = disagree_claimant_notice_reason if earnings_and_benefits_hash[:agree_with_claimant_notice] == false
    earnings_and_benefits_hash[:disagree_claimant_pension_benefits_reason] = disagree_claimant_pension_benefits_reason if earnings_and_benefits_hash[:agree_with_claimant_pension_benefits] == false

    earnings_and_benefits_hash
  end

  validates :queried_hours,
    numericality: true,
    allow_blank: true,
    if: :disagree_claimants_hours?
  validates :queried_pay_before_tax, :queried_take_home_pay,
    numericality: true,
    allow_blank: true,
    if: :disagree_earnings_details?
  validates :disagree_claimant_notice_reason,
    length: {
      maximum: 400
    },
    if: :disagree_claimants_notice?
  validates :disagree_claimant_pension_benefits_reason,
    length: {
      maximum: 350
    },
    if: :disagree_claimants_pension_benefits?

  private

  def disagree_claimants_hours?
    agree_with_claimants_hours == false
  end

  def disagree_earnings_details?
    agree_with_earnings_details == false
  end

  def disagree_claimants_notice?
    agree_with_claimant_notice == false
  end

  def disagree_claimants_pension_benefits?
    agree_with_claimant_pension_benefits == false
  end
end