require 'webmock/rspec'
app_host = ENV.fetch('CAPYBARA_SERVER_HOST', ENV.fetch('HOSTNAME', `hostname`.strip))
storage_host = URI.parse(ENV.fetch('AZURE_STORAGE_BLOB_HOST', 'http://azure_blob_storage.et.127.0.0.1.nip.io:1000')).host
WebMock.disable_net_connect!(allow: [app_host, 'chromedriver.storage.googleapis.com', storage_host, 'github.com', 'objects.githubusercontent.com'], allow_localhost: true)
