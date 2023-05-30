require "uk_postcode"
class PostcodeValidator < ActiveModel::EachValidator

  def initialize(options)
    my_options = options.dup
    self.postcode_service = my_options.delete(:postcode_service) || UKPostcode
    super my_options
  end

  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, :blank)
    else
      postcode = postcode_service.parse(value)
      record.errors.add(attribute, :invalid_postcode) unless postcode.full_valid?
    end
  end

  private

  attr_accessor :postcode_service
end
