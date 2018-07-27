require 'securerandom'
class Store < ApplicationRecord
  attribute :uuid, :string
  serialize :hash_store
  serialize :api_response
  before_validation :generate_uuid, unless: :uuid_present?

  private

  def uuid_present?
    uuid.present?
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
