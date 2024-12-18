require 'rails_helper'
RSpec.describe EmailAddressValidator do

  let(:model_class) do
    Class.new do
      include ActiveModel::Model
      attr_accessor :email

      def self.name
        'MyModel'
      end

      validates :email, email_address: true
    end
  end

  it 'validates a recognisable email address' do
    model = model_class.new(email: "test@example.com")

    model.valid?

    expect(model.errors).not_to include :email
  end

  it 'validates an email address with two TLDs' do
    model = model_class.new(email: "test@example.uk.com")

    model.valid?

    expect(model.errors).not_to include :email
  end

  it 'validates an email address with underscores, dots and hyphens' do
    model = model_class.new(email: "under_dot.hyphen-tests@example.com")

    model.valid?

    expect(model.errors).not_to include :email
  end

  it 'validates an email address with numbers' do
    model = model_class.new(email: "test123@example-123.com")

    model.valid?

    expect(model.errors).not_to include :email
  end

  it 'does not validate an email address without a TLD' do
    model = model_class.new(email: "test@example")

    model.valid?

    expect(model.errors.details[:email]).to include a_hash_including(error: :invalid_email)
  end

  it 'does not validate an email address with a one character TLD' do
    model = model_class.new(email: "test@example.c")

    model.valid?

    expect(model.errors.details[:email]).to include a_hash_including(error: :invalid_email)
  end

  it 'does not validate an email address with more than one "@"' do
    model = model_class.new(email: "test@@example.com")

    model.valid?

    expect(model.errors.details[:email]).to include a_hash_including(error: :invalid_email)
  end

  it 'does not validate an email address without a username/recipient' do
    model = model_class.new(email: "@example.com")

    model.valid?

    expect(model.errors.details[:email]).to include a_hash_including(error: :invalid_email)
  end

  it 'does not validate an email address without an "@" sign' do
    model = model_class.new(email: "testexample.com")

    model.valid?

    expect(model.errors.details[:email]).to include a_hash_including(error: :invalid_email)
  end

end
