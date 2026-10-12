# frozen_string_literal: true

# Validates an array of values with a 'sub validator'
class ArrayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) && return unless value.is_a? Array

    value.each do |v|
      options.each_pair do |validator_key, validation_options|
        next if validator_key.in?([:allow_blank, :allow_nil])

        validator_class = "ActiveModel::Validations::#{validator_key.to_s.camelize}Validator".safe_constantize
        validator_class ||= "#{validator_key.to_s.camelize}Validator".safe_constantize
        raise "Unknown validator #{validator_class}" unless validator_class

        validator = validator_class.new(attributes:, **validation_options)
        validator.validate_each(record, attribute, v)
      end
    end
  end
end
