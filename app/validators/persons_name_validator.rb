class PersonsNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return record.errors.add(attribute, :contains_numbers) if value =~ /\d/

    record.errors.add(attribute, :invalid_name) unless value =~ /\A([a-zA-Z\ \.\'\-])+\ ([a-zA-Z\ \.\'\-])+\z/
  end
end
