require 'rails_helper'

RSpec.describe Store, type: :model do

  let(:populated_store) { described_class.new(uuid: '32db7ef9-1144-464e-b561-9c8880b41d28', hash_store: { hash_key: :key_value }) }

  it "stores a SecureRandom.uuid" do
    store = described_class.new(uuid: '8002e436-dc3a-452e-a4fd-9ba466c737b1')

    expect(store.uuid).to eql '8002e436-dc3a-452e-a4fd-9ba466c737b1'
  end

  it "serializes hash_store to retain hash type" do
    store = described_class.new(hash_store: {})

    expect(store.hash_store).to be_a(Hash)
  end

  it "stores an empty hash" do
    store = described_class.new(hash_store: {})

    expect(store.hash_store).to be_empty
  end

  it "stores a populated hash" do
    store = described_class.new(hash_store: { key: "value" })

    expect(store.hash_store[:key]).to eql "value"
  end

  it "saves the uuid to the database" do
    store = described_class.new(uuid: '8002e436-dc3a-452e-a4fd-9ba466c737b1')

    expect(store.save).to be true
  end

  it "generates a uuid before save" do
    store = described_class.new

    store.save
    expect(store.uuid).to be_a(String)
  end

  it "saves the hash_store to the database" do
    store = described_class.new(hash_store: { key: "value" })

    expect(store.save).to be true
  end

  it "loads the uuid from the database" do
    expect(populated_store.uuid).to eql '32db7ef9-1144-464e-b561-9c8880b41d28'
  end

  it "loads the hash_store from the database" do
    expect(populated_store.hash_store).to eql(hash_key: :key_value)
  end

end
