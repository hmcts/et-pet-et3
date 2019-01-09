module TranslateRepresentativeHelper
  def translate_representative(radio_button_value)
    return nil if radio_button_value.nil?
    t "helpers.label.your_representatives_details.type_of_representative.choices.#{radio_button_value.parameterize.underscore}"
  end
end