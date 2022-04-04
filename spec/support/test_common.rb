require_relative '../../test_common/capybara'
require_relative '../../test_common/messaging'
require_relative '../../test_common/page_objects'
require_relative '../../test_common/helpers'
require_relative '../../test_common/et_test_helpers'

RSpec.configure do |c|
  c.include ET3::Test::Pages, type: :feature
end

RSpec.configure do |c|
  c.include ET3::Test::Setup, type: :feature
end

RSpec.configure do |c|
  c.include ET3::Test::Cookies, type: :request
  c.include ET3::Test::Cookies, type: :feature
end

