class AdditionalInformation < BaseForm
  attribute :upload_additional_information, :gds_azure_file
  attribute :upload_file_name, :string

  def to_h
    {
      upload_additional_information: upload_additional_information,
    }
  end
end
