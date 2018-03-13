class EarningsAndBenefits < BaseForm
  attribute :agree_with_claimants_hours, :boolean
  attribute :queried_hours, :float
  attribute :agree_with_earnings_details, :boolean
  attribute :queried_pay_before_tax, :float
  attribute :queried_pay_before_tax_period, :string
  attribute :queried_take_home_pay, :float
  attribute :queried_take_home_pay_period, :string
  attribute :agree_with_claimant_notice, :boolean
  attribute :disagree_claimant_notice_reason, :text
  attribute :agree_with_claimant_pension_benefits, :boolean
  attribute :disagree_claimant_pension_benefits_reason, :text

  def to_h # rubocop:disable Metrics/MethodLength  
    {
      agree_with_claimants_hours: agree_with_claimants_hours,
      queried_hours: queried_hours,
      agree_with_earnings_details: agree_with_earnings_details,
      queried_pay_before_tax: queried_pay_before_tax,
      queried_pay_before_tax_period: queried_pay_before_tax_period,
      queried_take_home_pay: queried_take_home_pay,
      queried_take_home_pay_period: queried_take_home_pay_period,
      agree_with_claimant_notice: agree_with_claimant_notice,
      disagree_claimant_notice_reason: disagree_claimant_notice_reason,
      agree_with_claimant_pension_benefits: agree_with_claimant_pension_benefits,
      disagree_claimant_pension_benefits_reason: disagree_claimant_pension_benefits_reason
    }
  end
end
