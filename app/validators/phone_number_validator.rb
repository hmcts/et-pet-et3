class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_phone_number) unless value =~ /\A(\+?)((\d(\ ?)(\-?)){7,30})\z/
  end
end
