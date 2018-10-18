require 'aws-sdk-s3'

RSpec.configure do |c|
  c.before(:suite) do
    s3_config = {
        region: ENV.fetch('AWS_REGION', 'us-east-1'),
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', 'accessKey1'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', 'verySecretKey1'),
        endpoint: ENV.fetch('AWS_ENDPOINT', 'http://localhost:9000/'),
        force_path_style: ENV.fetch('AWS_S3_FORCE_PATH_STYLE', 'true') == 'true'
    }
    local_s3_client = Aws::S3::Client.new(s3_config)
    Aws::S3::Bucket.new(client: local_s3_client, name: ENV.fetch('S3_DIRECT_UPLOAD_BUCKET', 'et3directbuckettest')).tap do |bucket|
      bucket.create unless bucket.exists?
      bucket.objects.each(&:delete)
    end
  end
end