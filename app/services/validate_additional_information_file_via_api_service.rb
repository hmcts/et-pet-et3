class ValidateAdditionalInformationFileViaApiService
  include ActiveModel::Model

  attr_reader :response_data

  def self.call(*, **)
    new.call(*, **)
  end

  def call(record, attribute, value, uuid: SecureRandom.uuid)
    @record = record
    @attribute = attribute

    response = submit_validation_request(value, uuid:)
    @response_data = parse_response(response)
    generate_errors(response)
    self
  rescue HTTParty::Error, SocketError, Errno::ECONNREFUSED, Errno::ECONNRESET, Errno::ETIMEDOUT, Timeout::Error,
         OpenSSL::SSL::SSLError => e
    errors.add(:base, :api_error, message: e.message)
    self
  end

  def valid?
    errors.empty?
  end

  private

  def submit_validation_request(value, uuid:)
    json = ApplicationController.render 'api/claim/validate_additional_information_file', format: :json, locals: {
      file: value, uuid:
    }

    HTTParty.post(
      "#{ENV.fetch('ET_API_URL', 'http://api.localhost:3100/api/v2')}/validate",
      body: json,
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }
    )
  end

  def parse_response(response)
    JSON.parse(response.body)
  rescue JSON::ParserError, TypeError
    {}
  end

  def generate_errors(response)
    return unless response.code == 422
    return unless response_data['status'] == 'not_accepted'

    response_data.fetch('errors', []).each do |error|
      options = (error['options'] || {}).deep_symbolize_keys
      source = error['source'] == '/' ? :base : error['source']
      errors.add(source, error['code'], **options)
    end
  end
end
