ActiveSupport.on_load(:after_initialize) do
  ActiveRecord::Type.register(:currency_float, CurrencyFloatType)
  ActiveRecord::Type.register(:et_date, EtDateType)
end
