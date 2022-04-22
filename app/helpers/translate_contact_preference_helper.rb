module TranslateContactPreferenceHelper
  def translate_contact_preference(radio_button_value)
    return nil if radio_button_value.nil?
    t "respondents_details.edit.contact_preference.options.#{radio_button_value}"
  end
end
