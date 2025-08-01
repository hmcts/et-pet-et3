module TranslateAddressCountryHelper
  def translate_address_country(radio_button_value)
    return nil if radio_button_value.nil?

    t "your_representatives_details.edit.representative_address_country.options.#{radio_button_value}"
  end
end
