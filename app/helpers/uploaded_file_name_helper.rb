module UploadedFileNameHelper
  def uploaded_file_name
    if @hash_store.dig(:additional_information_answers, :upload_file_name)
      @hash_store[:additional_information_answers][:upload_file_name] unless
        @hash_store.dig(:additional_information_answers, :upload_file_name).empty?
    end
  end
end