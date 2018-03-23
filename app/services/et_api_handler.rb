require 'httparty'

class EtApiHandler

  def self.submit(form_hash)
    one_dimensional_hash = {}
    form_hash.each_value { |hash_collection| hash_collection.each { |key, value| one_dimensional_hash[key] = value } }

    HTTParty.post("https://et-api-example.com/v2/repondents/response",
      body: one_dimensional_hash.to_json,
      headers: { content_type: 'application/json', 'Accept': 'application/json' })
  end

end
