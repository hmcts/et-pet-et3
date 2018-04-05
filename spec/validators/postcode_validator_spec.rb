require 'rails_helper'
RSpec.describe PostcodeValidator do

  let(:model_class) do
    postcode_service = mock_postcode_service
    Class.new do
      include ActiveModel::Model
      attr_accessor :postcode

      def self.name
        'MyModel'
      end

      validates :postcode, postcode: { postcode_service: postcode_service }
    end
  end

  let(:mock_postcode_service) { class_spy("UKPostcode", parse: mock_postcode_instance) }
  let(:mock_postcode_instance) { double("mock_postcode_instance", full_valid?: true) } # rubocop:disable RSpec/VerifiedDoubles

  it 'passes the correct data to the UKPostcode service' do
    model = model_class.new(postcode: "WC1A AAA")

    model.valid?

    expect(mock_postcode_service).to have_received(:parse).with("WC1A AAA")
  end

  it 'will call the full_valid? method' do
    model = model_class.new(postcode: "SW1H 9AJ")

    model.valid?

    expect(mock_postcode_instance).to have_received(:full_valid?)
  end

  it 'will not call the parse method if postcode is nil' do
    model = model_class.new(postcode: nil)

    model.valid?

    expect(mock_postcode_service).not_to have_received(:parse)
  end

  it 'will validate a UK postcode without returning an error' do
    model = model_class.new(postcode: "SW1H 9AJ")

    model.valid?

    expect(model.errors).not_to include :postcode
  end

  it 'will return an error when an invalid postcode is entered' do
    allow(mock_postcode_instance).to receive(:full_valid?).and_return(false)
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
