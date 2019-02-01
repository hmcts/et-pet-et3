class RemotelyValidateOfficeCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_office) if
        EtApiHandler.validate_response(attribute, value) == "invalid_office_code"
  end
end
