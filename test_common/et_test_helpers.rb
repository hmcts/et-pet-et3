require 'et_test_helpers'
EtTestHelpers.config.translation = ->(key, **kwargs) { ::ET3::Test::Messaging.instance.t(key, **kwargs) }
