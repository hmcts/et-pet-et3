require "uk_postcode"
class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil?
      record.errors.add(attribute, :blank)
    else
      postcode = UKPostcode.parse(value)
      record.errors.add(attribute, :invalid) unless postcode.full_valid?
    end
  end
end
