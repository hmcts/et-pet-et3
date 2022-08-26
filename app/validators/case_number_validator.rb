class CaseNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless value =~ %r{\A(13|14|16|18|22|23|24|25|26|32|33|41|99|6\d|8\d)\d{5}\/\d{4}\z}
  end
end
