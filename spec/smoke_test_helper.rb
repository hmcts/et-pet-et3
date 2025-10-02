require 'spec_helper'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
require_relative 'support/messaging'
ignore_list = ['spec/support/database_cleaner.rb'].map do |relative_path|
  Rails.root.join(relative_path).to_s
end
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each do |f|
  if ignore_list.include?(f)
    puts "Ignoring #{f}"
    next
  end

  require f
end
