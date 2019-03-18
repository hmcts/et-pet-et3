require_relative './test_common'

RSpec.configure do |c|
  c.before(:suite) do

    ET3::Test::AzureHelpers.configure_test_container
    # TODO: Only use this once
    # ET3::Test::AzureHelpers.configure_cors
  end
end