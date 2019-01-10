class BaseForm < ApplicationRecord
  establish_connection adapter: :nulldb,
                       schema: 'config/nulldb_schema.rb'

  def self.human_attribute_name(attribute_name, *)
    translated_attribute = catch :exception do
      I18n.translate("attributes.#{attribute_name}", throw: true)
    end
    if translated_attribute.is_a?(I18n::MissingTranslation)
      super
    else
      translated_attribute
    end
  end
end
