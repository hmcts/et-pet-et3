Rails.application.config.to_prepare do
  ActiveRecord::Type.register(:currency_float, CurrencyFloatType)
  ActiveRecord::Type.register(:et_date, EtDateType)
end
