class AdditionalInformation < BaseForm
  attribute :upload_additional_information, :string

  def to_h
    {
      upload_additional_information: upload_additional_information
    }
  end
end
