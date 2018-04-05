class PersonsNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /\d/
      record.errors.add(attribute, :contains_numbers)
    elsif value !~ /\ /
      record.errors.add(attribute, :contains_no_spaces)
    end
    record.errors.add(attribute, :invalid) unless value =~ /\A([a-zA-Z\ \.\'\-])+\ ([a-zA-Z\ \.\'\-])+\z/
  end
end
