require 'httparty'

class EtApiHandler

  def self.submit(form_hash)
    # form_hash is a key/value pair for each page in the form
    # The key states the page name, the value is a group of hashes
    # The line below flattens this while retaining the hash structure
    one_dimensional_hash = form_hash.values.inject(&:merge)

    http_response = HTTParty.post("#{ENV.fetch('ET_API_URL', 'https://et-api-example.com')}/v2/respondents/response",
      body: one_dimensional_hash.to_json,
      headers: { content_type: 'application/json', 'Accept': 'application/json' })

    http_response.parsed_response
  end
end
