module TranslatePayPeriodHelper
  def translate_pay_period(radio_button_value)
    return nil if radio_button_value.nil?

    t "helpers.label.earnings_and_benefits.queried_pay_before_tax_period.choices.#{radio_button_value.downcase}"
  end
end
