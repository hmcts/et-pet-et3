class EmailAddressValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_email) unless value =~ EMAIL_REGEX
  end
end
