module MoneyHelper
  def money_in_pounds(value)
    return nil if value.nil? || value == ''

    number_to_currency(value, unit: '&pound;'.html_safe)
  end
end
