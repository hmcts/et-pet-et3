require 'securerandom'
class Store < ApplicationRecord
  attribute :uuid, :string
  serialize :hash_store, coder: YAML
  serialize :api_response, coder: YAML
  before_validation :generate_uuid, unless: :uuid_present?
  belongs_to :user

  private

  def uuid_present?
    uuid.present?
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
