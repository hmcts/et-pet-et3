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
end
