class CurrencyFloatType < ActiveModel::Type::Float
  CURRENCY_REGEX = /\A\s*\d*.\d*\s*\z/

  def cast(value)
    return value if value.is_a?(Integer)
    value.delete!('£,') if value.is_a?(String)
    return value if value.is_a?(String) && !CURRENCY_REGEX.match?(value)
    super.truncate(2)
  end
end
