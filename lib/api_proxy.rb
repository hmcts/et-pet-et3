require 'rack-proxy'

class ApiProxy < Rack::Proxy
  def rewrite_env(env)
    env["HTTP_HOST"] = ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')
    env["REQUEST_URI"] = "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/s3/create_signed_url"
    env["REQUEST_PATH"] = "/api/v2/s3/create_signed_url"
    env["SCRIPT_NAME"] = "/api/v2/s3/create_signed_url"
    env["PATH_INFO"] = ""
    env
  end

end
