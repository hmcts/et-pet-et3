class EarningsAndBenefitsController < ApplicationController
  def edit
    @earnings_and_benefits ||= EarningsAndBenefits.new(current_store.hash_store.fetch(:earnings_and_benefits_answers, {}))
    convert_to_currency(:queried_pay_before_tax) unless @earnings_and_benefits[:queried_pay_before_tax].nil?
    convert_to_currency(:queried_take_home_pay) unless @earnings_and_benefits[:queried_take_home_pay].nil?
  end

  def update
    @earnings_and_benefits = EarningsAndBenefits.new(earnings_and_benefits_params)
    if @earnings_and_benefits.valid?
      current_store.hash_store[:earnings_and_benefits_answers] = @earnings_and_benefits.to_h
      redirect_to edit_response_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def earnings_and_benefits_params
    params.require(:earnings_and_benefits).permit(:agree_with_claimants_hours, :queried_hours,
      :agree_with_earnings_details, :queried_pay_before_tax, :queried_pay_before_tax_period, :queried_take_home_pay,
      :queried_take_home_pay_period, :agree_with_claimant_notice, :disagree_claimant_notice_reason,
      :agree_with_claimant_pension_benefits, :disagree_claimant_pension_benefits_reason)
  end

  def convert_to_currency(attribute_symbol)
    @earnings_and_benefits[attribute_symbol] =
      view_context.number_to_currency(@earnings_and_benefits[attribute_symbol], unit: "")
  end
end
