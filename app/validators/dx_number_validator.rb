class DxNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "This is not a valid dx number" unless value =~ /\A\z/ # TODO: Build correct regex
  end
end
