class MigrateUploadedFilesToNewFormat < ActiveRecord::Migration[6.0]
  class Store < ActiveRecord::Base
    self.table_name = :stores
    serialize :hash_store, coder: YAML
    serialize :api_response, coder: YAML
  end

  def up
    Store.where("hash_store ~ E':upload_file_name: [^\\\']+$' OR hash_store ~ E':upload_file_name: \\\'.+\\\''").where(api_response: nil).each do |store|
      path = store.hash_store.dig(:additional_information_answers, :upload_additional_information)
      filename = store.hash_store.dig(:additional_information_answers, :upload_file_name)
      announce("Upgrading store id #{store.id}")
      next if path.nil? || filename.nil?

      new_value = {
                    path: path,
                    filename: filename,
                    content_type: 'application/rtf'
                  }.with_indifferent_access
      store.hash_store[:additional_information_answers][:upload_additional_information] = new_value
      store.hash_store[:additional_information_answers].delete(:upload_file_name)
      store.save(touch: false)
      announce("Upgraded store id #{store.id}")
    end
  end

  def down

  end
end
