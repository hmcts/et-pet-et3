module ET3
  module Test
    module AzureHelpers
      # TODO: Put the env vars into constants
      # TODO: DRY up the options

      def self.configured_test_client
        options = default_options

        options[:storage_blob_host] = ENV['AZURE_STORAGE_BLOB_HOST'] if ENV.key?('AZURE_STORAGE_BLOB_HOST')
        options[:use_path_style_uri] = ENV['AZURE_STORAGE_BLOB_FORCE_PATH_STYLE'] == 'true' if ENV.key?('AZURE_STORAGE_BLOB_FORCE_PATH_STYLE')

        @configured_test_client ||= Azure::Storage.client options
      end

      def self.configure_test_container
        direct_container_name = ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_CONTAINER', 'et3-direct-bucket-test')

        direct_upload_containers = configured_test_client.blob_client.list_containers
        if direct_upload_containers.map(&:name).include?(direct_container_name)
          puts "Azure already has container #{direct_container_name}"
        else
          configured_test_client.blob_client.create_container(direct_container_name)
          puts "Container #{direct_container_name} added to azure"
        end
      end

      def self.configured_signer
        Azure::Storage::Core::Auth::SharedAccessSignature.new(ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_ACCOUNT', 'devstoreaccount1'),
                                                              ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_ACCESS_KEY', 'Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw=='))
      end

      def self.url_for_direct_upload(key, expires_in:)
        configured_signer.signed_uri(
          configured_test_client.blob_client.generate_uri("et3-direct-bucket-test/#{key}"), false,
          service: "b",
          permissions: "rw",
          expiry: expires_in ? Time.now.utc.advance(seconds: expires_in).iso8601 : nil
        ).to_s
      end

      def self.configure_cors
        direct_upload_client = configured_test_client
        service_properties = direct_upload_client.blob_client.get_service_properties
        if service_properties.cors.cors_rules.empty?
          cors_rule = Azure::Storage::Service::CorsRule.new
          cors_rule.allowed_origins = ['*']
          cors_rule.allowed_methods = %w(POST GET PUT HEAD)
          cors_rule.allowed_headers = ['*']
          cors_rule.exposed_headers = ['*']
          cors_rule.max_age_in_seconds = 3600
          service_properties.cors.cors_rules = [cors_rule]
          direct_upload_client.blob_client.set_service_properties(service_properties)
          puts "Direct upload storage account now has cors configured"
        else
          puts "Direct upload storage account has existing cors config - cowardly refusing to touch it"
        end
      end

      def self.keys_in_container

        stored_items = configured_test_client.blob_client.list_blobs(ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_CONTAINER', 'et3-direct-bucket-test'))

        stored_items.map(&:name)
      end

      private

      def self.default_options
        {
          storage_account_name: ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_ACCOUNT', 'devstoreaccount1'),
          storage_access_key: ENV.fetch('AZURE_STORAGE_DIRECT_UPLOAD_ACCESS_KEY', 'Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==')
        }
      end
    end
  end
end
