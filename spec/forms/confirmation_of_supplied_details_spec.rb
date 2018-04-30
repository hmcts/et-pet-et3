require 'rails_helper'

RSpec.describe ConfirmationOfSuppliedDetails, type: :model do

  let(:populated_confirmation_of_supplied_details) { described_class.new(email_receipt: 'test@example.com', email_receipt_confirmation: 'test@example.com') }

  context 'with validators' do

    it 'will not validate email addressess that do not match' do
      populated_confirmation_of_supplied_details.email_receipt = "test@example.com"
      populated_confirmation_of_supplied_details.email_receipt_confirmation = "example@test.com"

      populated_confirmation_of_supplied_details.valid?

      expect(populated_confirmation_of_supplied_details.errors.details[:email_receipt_confirmation]).to include a_hash_including(error: :confirmation)
    end
  end

  context 'when correctly populated' do

    it 'returns the correct email receipt' do
      expect(populated_confirmation_of_supplied_details.email_receipt).to eql 'test@example.com'
    end

    it 'returns the correct email receipt confirmation' do
      expect(populated_confirmation_of_supplied_details.email_receipt_confirmation).to eql 'test@example.com'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_confirmation_of_supplied_details.to_h).to be_a(Hash)
    end

    it 'will return the have_representative key and value pair' do
      expect(populated_confirmation_of_supplied_details.to_h).to include(email_receipt: 'test@example.com')
    end
  end

  context 'when left blank' do
    it 'will not raise a validation error when both email_receipt and confirmation are empty' do
      populated_confirmation_of_supplied_details.email_receipt = nil
      populated_confirmation_of_supplied_details.email_receipt_confirmation = nil

      populated_confirmation_of_supplied_details.valid?

      expect(populated_confirmation_of_supplied_details).to be_valid
    end
  end
end
