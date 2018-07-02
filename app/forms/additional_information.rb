class AdditionalInformation < BaseForm
  attribute :upload_additional_information, :string
  attribute :upload_file_name, :string

  def to_h
    {
      upload_additional_information: upload_additional_information,
      upload_file_name: upload_file_name
    }
  end
end
