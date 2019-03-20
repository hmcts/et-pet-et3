module EtDropzoneUploader
  module DropzoneFormHelper
    def dropzone_form_helper(form_id, upload_key_id, file_name_id)
      render "et_dropzone_uploader/uploader_form", form_id: form_id, upload_key_id: upload_key_id, file_name_id: file_name_id
    end
  end
end
