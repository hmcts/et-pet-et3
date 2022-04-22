module TranslatePayPeriodHelper
  def translate_pay_period(radio_button_value)
    return nil if radio_button_value.nil?

    t "earnings_and_benefits.edit.queried_pay_before_tax_period.options.#{radio_button_value}"
  end
end
