require_relative '../../test_common/messaging'

RSpec.configure do |c|
  c.include ET3::Test::I18n, type: :feature
end