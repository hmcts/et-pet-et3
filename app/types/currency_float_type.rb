class CurrencyFloatType < ActiveModel::Type::Float
  CURRENCY_REGEX = /\A\s*\d*.\d{0,2}\s*\z/

  def cast(value)
    return value if value.is_a?(Integer)
    value.delete!('£,') if value.is_a?(String)
    return value if value.is_a?(String) && !CURRENCY_REGEX.match?(value)
    super
  end
end