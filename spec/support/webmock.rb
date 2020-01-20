require 'webmock/rspec'
app_host = ENV.fetch('CAPYBARA_SERVER_HOST', ENV.fetch('HOSTNAME', `hostname`.strip))
WebMock.disable_net_connect!(allow: [app_host, 'chromedriver.storage.googleapis.com', 'azure_blob_storage.et.127.0.0.1.nip.io', 'github.com'], allow_localhost: true)
