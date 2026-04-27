require 'webmock/rspec'
app_host = ENV.fetch('CAPYBARA_SERVER_HOST', ENV.fetch('HOSTNAME', `hostname`.strip))
storage_host = URI.parse(ENV.fetch('AZURE_STORAGE_BLOB_HOST', 'http://et_azure_blob_storage.localhost:1000')).host
WebMock.disable_net_connect!(allow: [app_host, 'chromedriver.storage.googleapis.com', storage_host, 'github.com', 'objects.githubusercontent.com'], allow_localhost: true)
