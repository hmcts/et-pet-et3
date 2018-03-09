require 'rails_helper'

RSpec.describe Store, type: :model do

  let(:populated_store) { described_class.new(uuid: 'ndlYb8c6ggOB68XKsACDqJNOGT01w4f5CLhXoIpyHiP7Kw18ILfjnbbinC1nFtTN', hash_store: { hash_key: :key_value }) }

  it "stores a 64bit unique user id" do
    store = described_class.new(uuid: 'NTtFn1CnibbnjfLI81wK7PiHypIoXhLC5f4w10TGONJqDCAsKX86BOgg6c8bYldn')

    expect(store.uuid).to eql 'NTtFn1CnibbnjfLI81wK7PiHypIoXhLC5f4w10TGONJqDCAsKX86BOgg6c8bYldn'
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
    store = described_class.new(uuid: 'NTtFn1CnibbnjfLI81wK7PiHypIoXhLC5f4w10TGONJqDCAsKX86BOgg6c8bYldn')

    expect(store.save).to be true
  end

  it "saves the hash_store to the database" do
    store = described_class.new(hash_store: { key: "value" })

    expect(store.save).to be true
  end

  it "loads the uuid from the database" do
    expect(populated_store.uuid).to eql 'ndlYb8c6ggOB68XKsACDqJNOGT01w4f5CLhXoIpyHiP7Kw18ILfjnbbinC1nFtTN'
  end

  it "loads the hash_store from the database" do
    expect(populated_store.hash_store).to eql(hash_key: :key_value)
  end

end
