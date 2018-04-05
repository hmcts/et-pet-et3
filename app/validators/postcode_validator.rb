require "uk_postcode"
class PostcodeValidator < ActiveModel::EachValidator

  def initialize(postcode_service: UKPostcode, **args)
    self.postcode_service = postcode_service
    super args
  end

  def validate_each(record, attribute, value)
    if value.nil?
      record.errors.add(attribute, :blank)
    else
      postcode = postcode_service.parse(value)
      record.errors.add(attribute, :invalid) unless postcode.full_valid?
    end
  end

  private

  attr_accessor :postcode_service
end
