class EarningsAndBenefitsController < ApplicationController
  def edit
    @earnings_and_benefits = EarningsAndBenefits.new
  end

  def update
    @earnings_and_benefits = EarningsAndBenefits.new(earnings_and_benefits_params)
    if @earnings_and_benefits.valid?
      redirect_to edit_response_path
    end
  end

  private

  def earnings_and_benefits_params
    params.require(:earnings_and_benefits).permit(:agree_with_claimants_hours, :queried_hours,
      :agree_with_earnings_details, :queried_pay_before_tax, :queried_pay_before_tax_period, :queried_take_home_pay,
      :queried_take_home_pay_period, :agree_with_claimant_notice, :disagree_claimant_notice_reason,
      :agree_with_claimant_pension_benefits, :disagree_claimant_pension_benefits_reason)
  end
end
