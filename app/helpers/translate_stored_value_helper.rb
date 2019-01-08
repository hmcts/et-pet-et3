module TranslateStoredValueHelper
  def translate_stored_value(stored_value, question_i18n_reference)
    return nil if stored_value.nil?

    t("helpers.label.#{question_i18n_reference}.choices.#{stored_value ? 'yes' : 'no'}")
  end
end