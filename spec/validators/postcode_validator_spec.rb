require 'rails_helper'
RSpec.describe PostcodeValidator do

  let(:model_class) do
    Class.new do
      include ActiveModel::Model
      attr_accessor :postcode

      def self.name
        'MyModel'
      end

      validates :postcode, postcode: true
    end
  end

  it 'will validate a UK postcode without returning an error' do
    model = model_class.new(postcode: "SW1H 9AJ")

    model.valid?

    expect(model.errors).not_to include :postcode
  end

  it 'will return an error when an invalid postcode is entered' do
    model = model_class.new(postcode: "not a postcode")

    model.valid?

    expect(model.errors.details[:postcode]).to include a_hash_including(error: :invalid)
  end

  it 'will return an error when nil' do
    model = model_class.new(postcode: nil)

    model.valid?

    expect(model.errors.details[:postcode]).to include a_hash_including(error: :blank)
  end

end
