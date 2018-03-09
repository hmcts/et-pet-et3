class Store < ApplicationRecord
  attribute :uuid, :string
  serialize :hash_store
end
