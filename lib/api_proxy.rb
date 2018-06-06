require 'rack-proxy'

class ApiProxy < Rack::Proxy
  def rewrite_env(env)
    env["HTTP_HOST"] = "api.et.127.0.0.1.nip.io"
    env["REQUEST_URI"] = "http://api.et.127.0.0.1.nip.io:3100/api/v2/s3/create_signed_url"
    env["REQUEST_PATH"] = "/api/v2/s3/create_signed_url"
    env["SCRIPT_NAME"] = "/api/v2/s3/create_signed_url"
    env
  end

end
