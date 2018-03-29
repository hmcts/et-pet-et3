class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    record.errors.add(attribute, :invalid) unless value =~ email_regex
  end
end
