module TranslateStoredValueHelper
  def translate_stored_value(stored_value, question_i18n_reference)
    return nil if stored_value.to_s.empty?

    page, question = question_i18n_reference.split('.')
    t("#{page}.edit.#{question}.options.#{stored_value}")
  end
end
