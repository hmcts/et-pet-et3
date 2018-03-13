require 'securerandom'
class Store < ApplicationRecord
  attribute :uuid, :string
  serialize :hash_store
  before_validation :generate_uuid, unless: :uuid_present?

  private

  def uuid_present?
    uuid.present?
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
