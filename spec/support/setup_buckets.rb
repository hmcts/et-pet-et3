require 'aws-sdk-s3'
require_relative './test_common'

RSpec.configure do |c|
  c.before(:suite) do

    Aws::S3::Bucket.new(client: ET3::Test::S3Helpers.configured_test_client, name: ENV.fetch('S3_DIRECT_UPLOAD_BUCKET', 'et3directbuckettest')).tap do |bucket|
      bucket.create unless bucket.exists?
      bucket.objects.each(&:delete)
    end
  end
end