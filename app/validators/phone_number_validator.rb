class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless value =~ /\A(\+?)((\d(\ ?)(\-?)){7,})\z/
  end
end
