module UploadedFileNameHelper
  def uploaded_file_name
    if @hash_store.dig(:additional_information_answers, :upload_additional_information, :filename)
      @hash_store[:additional_information_answers][:upload_additional_information][:filename] unless
        @hash_store.dig(:additional_information_answers, :upload_additional_information, :filename).empty?
    end
  end
end
