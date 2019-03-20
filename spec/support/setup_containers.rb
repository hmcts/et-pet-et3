require_relative './test_common'

RSpec.configure do |c|
  c.before(:suite) do

    ET3::Test::AzureHelpers.configure_test_container
    ET3::Test::AzureHelpers.configure_cors
  end
end