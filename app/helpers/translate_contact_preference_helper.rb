module TranslateContactPreferenceHelper
  def translate_contact_preference(radio_button_value)
    t "helpers.label.respondents_detail.contact_preference.choices.#{radio_button_value}"
  end
end