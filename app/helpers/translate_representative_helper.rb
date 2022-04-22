module TranslateRepresentativeHelper
  def translate_representative(radio_button_value)
    return nil if radio_button_value.nil?
    t "your_representatives_details.edit.type_of_representative.options.#{radio_button_value}"
  end
end
