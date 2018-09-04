module UploadedFileNameHelper
  def uploaded_file_name
    if @hash_store[:additional_information_answers].key?(:upload_file_name) &&
        !@hash_store.dig(:additional_information_answers, :upload_file_name).empty?

      @hash_store[:additional_information_answers][:upload_file_name]
    end
  end
end
