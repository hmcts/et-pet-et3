module TranslateContactPreferenceHelper
  def translate_contact_preference(radio_button_value)
    return nil if radio_button_value.nil?
    t "helpers.label.respondents_detail.contact_preference.choices.#{radio_button_value}"
  end
end