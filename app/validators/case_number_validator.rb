class CaseNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless value =~ %r{\A\d{7}\/\d{4}\z}
  end
end
