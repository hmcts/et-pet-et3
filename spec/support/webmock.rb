require 'webmock/rspec'
app_host = ENV.fetch('CAPYBARA_SERVER_HOST', ENV.fetch('HOSTNAME', `hostname`.strip))
WebMock.disable_net_connect!(allow: [app_host, 'api.et.127.0.0.1.nip.io'], allow_localhost: true)
